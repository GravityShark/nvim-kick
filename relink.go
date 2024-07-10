package main

// Symlinks plugins in enabled-plugins.txt relative to the pluggers folders

import (
	"bufio"
	"io/fs"
	"log"
	"os"
	"path/filepath"
)

func main() {
	file, err := os.Open("enabled-plugins.txt")
	if err != nil {
		log.Fatal(err)
	}

	os.Chdir("./lua/pluggers/")
	defer file.Close()

	files, err := os.ReadDir("./")
	for _, v := range files {
		info, _ := v.Info()
		if info.Mode()&fs.ModeSymlink != 0 {
			os.Remove(v.Name())
		}
	}

	scanner := bufio.NewScanner(file)
	// optionally, resize scanner's capacity for lines over 64K, see next example
	for scanner.Scan() {
		plugin := scanner.Text()
		if plugin[0] != '#' {
			os.Symlink(plugin, filepath.Base(plugin))
		}
	}
}
