#! /bin/bash

if [[ "$1" = "-v" ]]; then
    VAL="$1"
else
    VAL=
fi

# compile main with ft::map
clang++ -Wall -Werror -Wextra -std=c++98 -D FT=1 main.cpp -o main.ft.out
# compile main with std::map
clang++ -Wall -Werror -Wextra -std=c++98 -D FT=0 main.cpp -o main.std.out

# run main.ft.out and save output to main.ft.output
START_TIME=$(perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)')
./main.ft.out 123
END_TIME=$(perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)')
echo "elapsed time ft: $(($END_TIME - $START_TIME))"

# run main.std.out and save output to main.std.output
START_TIME=$(perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)')
./main.std.out 123
END_TIME=$(perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)')
echo "elapsed time std: $(($END_TIME - $START_TIME))"
echo
sleep 1
read -n1 -s -r -p $'\033[1mPress any key to start our own tester:\n' key
echo "removing executables..."
sleep 2
rm -rf *.dSYM *.out
clear

# # compile main with ft
# clang++ -Wall -Werror -Wextra -std=c++98 -D STL=0 main_other.cpp -o main.ft.out
# # compile main with std
# clang++ -Wall -Werror -Wextra -std=c++98 -D STL=1 main_other.cpp -o main.std.out

# # run main.ft.out and save output to main.ft.output
# START_TIME=$(perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)')
# ./main.ft.out 123 > output_ft
# END_TIME=$(perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)')
# echo "elapsed time ft: $(($END_TIME - $START_TIME))"

# # run main.std.out and save output to main.std.output
# START_TIME=$(perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)')
# ./main.std.out 123 > output_std
# END_TIME=$(perl -MTime::HiRes -e 'printf("%.0f\n",Time::HiRes::time()*1000)')
# echo "elapsed time std: $(($END_TIME - $START_TIME))"
# echo
# sleep 1
# read -n1 -s -r -p $'\033[1mPress any key to start our own tester:\n' key
# echo "removing executables..."
# sleep 2
# rm -rf *.dSYM *.out
# clear


read -n1 -s -r -p $'\033[1mPress any key to launch MAP tests...\n' key
cd ./map ; ./test_map.sh  $VAL
read -n1 -s -r -p $'\033[1mPress any key to launch VECTOR tests...\n' key
cd ../vector ; ./test_vector.sh $VAL
read -n1 -s -r -p $'\033[1mPress any key to launch STACK tests...\n' key
cd ../stack; ./test_stack.sh $VAL