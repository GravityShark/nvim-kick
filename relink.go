// Symlinks plugins in enabled-plugins.txt relative to the pluggers folders
package main

import (
	"bufio"
	"io/fs"
	"log"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	file, err := os.Open("./enabled-plugins.txt")
	if err != nil {
		log.Fatal(err)
	}

	err = os.Chdir("./lua")
	if err != nil {
		log.Fatal(err)
	}

	defer file.Close()

	deleteSymlinks()
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		plugin := strings.TrimSpace(scanner.Text())

		if len(plugin) != 0 && plugin[0] != '#' {
			plugger := "../pluggers/" + plugin + ".lua"
			enabled := "enabled/" + filepath.Base(plugin) + ".lua"
			err = os.Symlink(plugger, enabled)
			if err != nil {
				log.Fatal(err)
			}
		}
	}
}

func deleteSymlinks() {
	os.Chdir("./enabled")
	files, err := os.ReadDir("./")
	if err != nil {
		log.Fatal(err)
		return
	}
	for _, v := range files {
		info, _ := v.Info()
		if info.Mode()&fs.ModeSymlink != 0 {
			err = os.Remove(v.Name())
			if err != nil {
				log.Fatal(err)
			}
		}
	}
	os.Chdir("../")
}
