﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _03.AnimalHierarchy
{
    class Kitten : Cat
    {
        public Kitten(string name, int age)
            : base(name, age)
        {
            this.Sex = 'F';
        }

    }
}
