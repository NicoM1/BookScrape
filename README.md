BookScrape
==========

**Disclaimer: Please remember, before posting the results of this tool, check to make sure no personal information or private sites are contained in it. I am not responsible for any damage as a result of posting the results of this tool, but I also do not want to hear that something I made has caused someone problems.
Thank you.**

A simple scraper for Chrome, letting you create readable text or html lists out of your boomarks

[path] is the path to Chromes bookmark storage, on Windows this is: "C:\Users\USER\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"

Usage:
    bs.exe [path] <output type> <format type>

    <output type> default
      save results to system clipboard

    <output type> -p
      print results to console

    <output type> -f
      save results to file at bs.exe's location
      Usage: bs.exe -f C:\Users\Me\Desktop\output.txt
    
    <format type> default
      format results as an indented text file

    <format type> -h
      format results as a clean html description list
      
Lisence:

The MIT License (MIT)

Copyright (c) 2014 Nico May

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
