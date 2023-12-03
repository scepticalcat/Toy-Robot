# frozen_string_literal: true

require "active_support/core_ext/object/blank"

class Application
  def initialize stdin, stdout
    @stdin = stdin
    @stdout = stdout
  end

  def start
    trap("SIGINT") { quit }

    run
  rescue Terminated
    quit
  end

  private

  attr_reader :stdin, :stdout

  def execute input
    command = CommandParser.parse input

    case command.scope
    when :application
      command.execute
    else
      # command.execute send(:scope)
      raise InvalidScopeError, command.scope
    end
  end

  def prompt
    stdout.print "> "

    stdin.gets.chomp
  end

  def quit
    stdout.puts "Bye!"

    exit
  end

  def run
    while (input = prompt)
      next unless input.present?

      begin
        message = execute input

        stdout.puts message unless message.blank?
      rescue CommandParser::CommandNotFoundError
        stdout.puts "Command '#{input}' not found, try 'HELP'"
      end
    end
  end

  class InvalidScopeError < StandardError; end
end
