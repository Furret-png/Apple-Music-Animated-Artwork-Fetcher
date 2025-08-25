![logo](https://raw.githubusercontent.com/Furret-png/Apple-Music-Animated-Artwork-Fetcher/refs/heads/main/assets/logo.webp "logo")
# Apple Music Animated Artwork Fetcher
## Features

- Downloads the animated artwork from Apple Music in Highest available HEVC quality.
- Can also multiplex the animated artwork with the track of your choice from that album.
- Will also tag the artwork with all the metadata of the album.

## Usage
Clone this repo
```
git clone https://github.com/bunnykek/Apple-Music-Animated-Artwork-Fetcher
cd Apple-Music-Animated-Artwork-Fetcher
```
### Nix Method

The python version this project requires is outdated. The easiest way to run it is using nix
```
nix-shell
python fetcher.py -h
```

### Typical Method

Make sure you have [python](https://www.python.org/ "python") installed in your system.

Download this repo and navigate into its directory or follow the below commands (install [git](https://git-scm.com/) first):

```
pip install -r requirements.txt
python fetcher.py -h
```

### Arguments
```
fetcher.py [-h] [-T TYPE] [-L LOOPS] [-A] url

Downloads animated cover artwork from Apple music.

positional arguments:
  url                   Album URL

options:
  -h, --help            show this help message and exit
  -T TYPE, --type TYPE  [tall,square] (tall/rectangle by default)
  -L LOOPS, --loops LOOPS
                        [int] Number of times you want to loop the artwork (2 by default)
  -A, --audio           Pass this flag if you also need the audio
```
Ex:
``` 
python fetcher.py -T tall -L 2 -A https://music.apple.com/us/album/planet-her-deluxe/1574004234
```

Videos will be saved in directory "Animated artworks".


## Examples of albums with animated covers
```
https://music.apple.com/us/album/is-this-it/266376953
https://music.apple.com/us/album/positions-deluxe-edition/1553944254
https://music.apple.com/us/album/after-hours-deluxe-video-album/1551901062
https://music.apple.com/us/album/planet-her-deluxe/1574004234
https://music.apple.com/us/album/folklore-deluxe-version/1528112358
```
## Example usage
![example-usage](https://raw.githubusercontent.com/Furret-png/Apple-Music-Animated-Artwork-Fetcher/refs/heads/main/assets/example-usage.png "example-usage")
