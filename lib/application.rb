# frozen_string_literal: true

class Application
  class << self
    def start stdin, stdout
      trap("SIGINT") { quit(stdout) }

      run stdin, stdout
    end

    private

    EXIT_PATTERN = /^EXIT$/i

    def prompt stdin, stdout
      stdout.print "> "

      stdin.gets.chomp
    end

    def quit stdout
      stdout.puts "Bye!"

      exit
    end

    def run stdin, stdout
      while (input = prompt(stdin, stdout))
        next unless input.present?

        command, *arguments = InputParser.parse input

        quit(stdout) if EXIT_PATTERN.match? command

        begin
          raise CommandNotFoundError
        rescue CommandNotFoundError
          stdout.puts "Command '#{command}' not found, try 'HELP'"
        end
      end
    end

    class CommandNotFoundError < StandardError; end
  end
end
