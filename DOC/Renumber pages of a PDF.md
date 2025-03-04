https://askubuntu.com/a/347338/2170092

You can do that with a text editor.



 - [metadata - How to change internal page numbers in the meta data of a PDF? - Super User](https://superuser.com/questions/232553/how-to-change-internal-page-numbers-in-the-meta-data-of-a-pdf)



As the answer says, open a PDF file with a text editor, search `/Catalog` entry, and then append an entry named `/PageLabels` like this:



    /PageLabels << /Nums [

    0 << /P (cover) >> % labels 1st page with the string "cover"

    1 << /S /r >> % numbers pages 2-6 in small roman numerals

    6 << /S /D >> % numbers pages 7-x in decimal arabic numerals

    ]

    >>



Note that the page indices (physical page numbers) begin with `0`.



Of cource, you can do this automatically using scripting languages.



[PDF Standards - Page Labels](http://pdf.editme.com/pdfua-PageLabels) has detailed specification.

normal
