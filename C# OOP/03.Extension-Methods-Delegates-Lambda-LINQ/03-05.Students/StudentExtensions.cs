﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _03_05.Students
{
//Problem 3. First before last
    //Write a method that from a given array of students finds all students whose first name is before its last name alphabetically.
    //Use LINQ query operators.
//Problem 4. Age range
//    Write a LINQ query that finds the first name and last name of all students with age between 18 and 24.
//Problem 5. Order students
//    Using the extension methods OrderBy() and ThenBy() with lambda expressions sort the students by first name and last name in descending order.
//    Rewrite the same with LINQ.
//Problem 9. Student groups
    //Create a class Student with properties FirstName, LastName, FN, Tel, Email, Marks (a List), GroupNumber.
    //Create a List<Student> with sample students. Select only the students that are from group number 2.
    //Use LINQ query. Order the students by FirstName.
//Problem 10. Student groups extensions
    //Implement the previous using the same query expressed with extension methods.
//Problem 11. Extract students by email
//    Extract all students that have email in abv.bg.
//    Use string methods and LINQ.
//Problem 12. Extract students by phone
    //Extract all students with phones in Sofia.
    //Use LINQ.

    public static class StudentExtensions
    {
        public static void FirstBeforeLastName(this List<Student> students)
        {
            var firstBeforeLast =
                                from student in students
                                where student.FirstName.CompareTo(student.LastName) < 0
                                select student.FirstName + " " + student.LastName;

            foreach (string student in firstBeforeLast)
            {
                Console.WriteLine(student);
            }
        }

        public static void AgeRange1824(this List<Student> students)
        {
            var ageRange1824 =
                            from student in students
                            where student.Age >= 18 && student.Age <= 24
                            select student.FirstName + " " + student.LastName;

            foreach (string student in ageRange1824)
            {
                Console.WriteLine(student);
            }
        }

        public static void OrderByFirstThenByLastNameLAMBDA(this List<Student> students)
        {
            var firstThenLast = students
                                .OrderByDescending(student => student.FirstName)
                                .ThenByDescending(student => student.LastName)
                                .Select(student => student.FirstName + " " + student.LastName);
            foreach (string student in firstThenLast)
            {
                Console.WriteLine(student);
            }
        }

        public static void OrderByFirstThenByLastNameLINQ(this List<Student> students)
        {
            var firstThenLast =
                                from student in students
                                orderby student.FirstName descending, student.LastName descending
                                select student.FirstName + " " + student.LastName;
            foreach (string student in firstThenLast)
            {
                Console.WriteLine(student);
            }
        }
        public static void SelectFromGroup2(this List<Student> students)
        {
            var selectedFromGroup2 =
                from student in students
                where student.GroupNumber == 2
                select student.FirstName + " " + student.LastName;

            foreach (string student in selectedFromGroup2)
            {
                Console.WriteLine(student);
            }
        }
        public static void OrderByFirstName(this List<Student> students)
        {
            var orderedByFirstName =
                            from student in students
                            orderby student.FirstName
                            select student.FirstName + " " + student.LastName;

            foreach (string student in orderedByFirstName)
            {
                Console.WriteLine(student);
            }
        }

        public static void ExtractByEmail(this List<Student> students)
        {
            string searchedEmail = "abv.bg";
            var studentExtracted =
                                from student in students
                                where student.Email.EndsWith(searchedEmail)
                                select student.FirstName + " " + student.LastName;

            foreach (var student in studentExtracted)
            {
                Console.WriteLine(student.ToString());
            }
        }

        public static void ExtractByPhone(this List<Student> students)
        {
            string phoneCodeSofia = "02";
            var extractedByPhone =
                    from student in students
                    where student.Tel.StartsWith(phoneCodeSofia)
                    select student.FirstName + " " + student.LastName;

            foreach (string student in extractedByPhone)
            {
                Console.WriteLine(student);
            }
        }

        public static void GroupByGroupN(this List<Student> students)
        {
            var grouped =
               from student in students
               group student by student.GroupNumber into gr
               select new { GroupN = gr.Key, Name = gr.ToList() };
            foreach (var item in grouped)
            {
                Console.WriteLine("Students in Group Number: {0}\n {1}", item.GroupN, string.Join(", ", item.Name));
                Console.WriteLine();
            }
        }

        public static void GroupByGroupNumberEXT(this List<Student> students)
        {
            var grouped = students.GroupBy(x => x.GroupNumber).Select(grp => new { GroupN = grp.Key, Name = grp.ToList() });
            foreach (var item in grouped)
            {
                Console.WriteLine("Students in Group Number: {0}\n {1}", item.GroupN, string.Join(", ", item.Name));
                Console.WriteLine();
            }        
        }
    }

}
