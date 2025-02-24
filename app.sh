#!/bin/sh

if [ $# -lt 2 ]; then
  echo "Usage: $0 <text file path> <output audio file path>"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#echo "Script directory: $SCRIPT_DIR"

#pwd

input_path="$1"
#echo $input_path
# Check if the path is absolute by seeing if it starts with '/'
if [[ "$input_path" != /* ]]; then
  input_path="$(pwd)/$input_path"
fi

#echo $input_path
if [ ! -e "$input_path" ]; then
  echo "The file '$input_path' does NOT exist."
  exit 1
fi


output_path="$2"
#echo $output_path

# Check if the path is absolute by seeing if it starts with '/'
if [[ "$output_path" != /* ]]; then
  output_path="$(pwd)/$output_path"
fi

#echo $output_path
if [ -e "$output_path" ]; then
  echo "The file '$output_path' exists."
  exit 1
fi

echo "TTS Start:"

cd $SCRIPT_DIR

/opt/anaconda3/envs/StyleTTS2_39/bin/python app.py $input_path $output_path

cd -

echo "TTS Done."