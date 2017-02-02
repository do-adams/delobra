#!/bin/bash
# delobra.sh - delete local branches
# bash script for deleting local branches in a git repository

getMergedBranches ()
{
	git branch --merged develop | grep -v -e develop -e master
}

cat << "EOF"
					                             
      | $$          | $$          | $$                         
  /$$$$$$$  /$$$$$$ | $$  /$$$$$$ | $$$$$$$   /$$$$$$  /$$$$$$ 
 /$$__  $$ /$$__  $$| $$ /$$__  $$| $$__  $$ /$$__  $$|____  $$
| $$  | $$| $$$$$$$$| $$| $$  \ $$| $$  \ $$| $$  \__/ /$$$$$$$
| $$  | $$| $$_____/| $$| $$  | $$| $$  | $$| $$      /$$__  $$
|  $$$$$$$|  $$$$$$$| $$|  $$$$$$/| $$$$$$$/| $$     |  $$$$$$$
 \_______/ \_______/|__/ \______/ |_______/ |__/      \_______/
                                                               
                                                               
                                                               
EOF
sleep .5

echo "delobra will delete the following local branches from your Git repository:"
getMergedBranches

while true; do
	read -p "Do you wish to continue? (Press Y/y to continue or N/n to exit) " ans
	case $ans in
		[Yy]* ) getMergedBranches | xargs git branch -d;
				echo "delobra has deleted your local branches."; break;;
		[Nn]* ) echo "delobra has exited - no branches were deleted."; exit;;
		* ) echo "Please answer yes or no.";;
	esac
done
