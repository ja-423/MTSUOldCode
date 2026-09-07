/*
Jaylon Atkins
CSCI 3110-001 (your section #)
Project #6
Due: 04/13/21
*/

#include <fstream>
#include <iostream>
#include <string>
#include <string.h>
using namespace std;

int main()
{
ifstream fancyfile;
fancyfile.open("input.txt");
string newword;

while(!fancyfile.eof())
{
    fancyfile >> newword;
    cout << newword << " ";
}
cout << "hey";
// addWord()
return 0;
}