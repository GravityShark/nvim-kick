package main

import (
	"bufio"
	"fmt"
	"io/fs"
	"log"
	"os"
	"path/filepath"
)

func main() {
	os.Chdir("./pluggers/")

	file, err := os.Open("enabled-plugins.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	files, err := os.ReadDir("./")
	for _, v := range files {
		info, _ := v.Info()
		if info.Mode()&fs.ModeSymlink != 0 {
			os.Remove(v.Name())
			fmt.Println(v.Name())
		}
	}

	scanner := bufio.NewScanner(file)
	// optionally, resize scanner's capacity for lines over 64K, see next example
	for scanner.Scan() {
		plugin := scanner.Text()
		os.Symlink(plugin, filepath.Base(plugin))
	}
}
