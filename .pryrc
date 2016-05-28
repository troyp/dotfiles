# coding: utf-8
# ===============================================================================
#                                       _______
#                                      |       |
#                                      | PRYRC |
#                                      |_______|


Pry.commands.alias_command 'ss', 'show-source -al'
Pry.commands.alias_command 'sd', 'show-doc -al'

# -------------------------------------------------------------------------------
# ,--------,
# | ByeBug |
# '--------'
# https://github.com/deivid-rodriguez/pry-byebug

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

# -------------------------------------------------------------------------------
# ,-------------,
# | Pry Colours |
# '-------------'

# =================
# Pry token colours
# =================

# http://stackoverflow.com/questions/7798795/how-to-adjust-pry-colors

CodeRay.scan("example", :ruby).term # just to load necessary files

TERM_TOKEN_COLORS = {
  :comment => "\e[34m"
}

module CodeRay module Encoders
    class Terminal < Encoder
      # override old colors
      TERM_TOKEN_COLORS.each_pair do |key, value|
        TOKEN_COLORS[key] = value
      end
    end
  end
end

# ==================
# printing in colour
# ==================

# http://stackoverflow.com/questions/8806643
# encoding: utf-8
class String
  def console_red;          colorize(self, "\e[1m\e[31m");  end
  def console_dark_red;     colorize(self, "\e[31m");       end
  def console_green;        colorize(self, "\e[1m\e[32m");  end
  def console_dark_green;   colorize(self, "\e[32m");       end
  def console_yellow;       colorize(self, "\e[1m\e[33m");  end
  def console_dark_yellow;  colorize(self, "\e[33m");       end
  def console_blue;         colorize(self, "\e[1m\e[34m");  end
  def console_dark_blue;    colorize(self, "\e[34m");       end
  def console_purple;       colorize(self, "\e[1m\e[35m");  end

  def console_def;          colorize(self, "\e[1m");  end
  def console_bold;         colorize(self, "\e[1m");  end
  def console_blink;        colorize(self, "\e[5m");  end

  def colorize(text, color_code)  "#{color_code}#{text}\e[0m" end
end

# =============
# colour prompt
# =============
PERSONAL_PROMPT = [
  proc do |target_self, nest_level, pry|
    n = "#{pry.input_array.size}";
    name = "#{pry.config.prompt_name}";
    slf = "#{Pry.view_clip(target_self)}";
    l = [n.length, 4].min;
    "┌─❬".console_dark_green + n.console_yellow + ( "❭" + "─"*(4-l) + "─❬" ).console_dark_green +
      name.console_dark_yellow + "❭──❬".console_dark_green + slf.console_yellow +
      "❭─❭❭ ".console_dark_green
  end,
  proc do |target_self, nest_level, pry|
    lname = "#{pry.config.prompt_name}".length;
    lslf = "#{Pry.view_clip(target_self)}".length;
    ( "╎" + "-"*(16+lname+lslf) + "╎ " ).console_dark_green
  end
]

PRY_EMACS_PROMPT = [
  proc do |target_self, nest_level, pry|
    ">> ".console_green
  end,
  proc do |target_self, nest_level, pry|
    "   "
  end
]

if ENV["INSIDE_EMACS"]
  Pry.config.prompt = PRY_EMACS_PROMPT
else
  Pry.config.prompt = PERSONAL_PROMPT
end
