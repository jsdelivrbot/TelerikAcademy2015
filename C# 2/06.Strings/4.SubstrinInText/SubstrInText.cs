﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/*Problem 4. Sub-string in text

    Write a program that finds how many times a sub-string is contained in a given text (perform case insensitive search).

Example:

The target sub-string is in

The text is as follows: We are living in an yellow submarine. We don't have anything else. inside the submarine is very tight. So we are drinking all the day. We will move out of it in 5 days.

The result is: 9.*/
namespace _4.SubstrinInText
{
    class SubstrInText
    {
        static void Main(string[] args)
        {
            string sub = "days";
            string text = "We are living in an yellow submarine. We don't have anything else. inside the submarine is very tight. So we are drinking all the day. We will move out of it in 5 days.";
            int counter = 0;

            for (int i = 0; i < text.Length - sub.Length; i++)
            {
                string subTemp = text.Substring(i, sub.Length);
                int isTheSame = string.Compare(subTemp, sub, true);
                if (isTheSame == 0)
                {
                    counter++;
                }
            }

            Console.WriteLine(counter);
        }
    }
}
