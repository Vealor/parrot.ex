defmodule Parrot do
  def parrotloop(index) do
    colourmap = [
      "\e[38;5;215m", # peach
      "\e[38;5;208m", # orange
      "\e[38;5;154m", # green
      "\e[38;5;86m",  # cyan
    	"\e[38;5;69m",  # blue
    	"\e[38;5;99m",  # purple
    	"\e[38;5;218m", # pink
    	"\e[38;5;163m", # fuschia
    	"\e[38;5;201m", # magenta
    	"\e[38;5;196m", # red
    ]
    filename = "frames/" <> Integer.to_string(index) <> ".txt"
    IO.puts("\e[H\e[2J")
    IO.write(colourmap |> Enum.at(index))
    File.stream!(filename)
    |> Enum.each(&IO.write/1)
    IO.write("\e[39m")
    index = rem((index+1),10)
    :timer.sleep(80)
    parrotloop(index)
  end

  def main() do
    parrotloop(0)
  end
end

Parrot.main()
