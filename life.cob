      *
      * CSCI3180 Principles of Programming Languages
      *
      * --- Declaration ---
      *
      * I declare that the assignment here submitted is original except for source
      * material explicitly acknowledged. I also acknowledge that I am aware of
      * University policy and regulations on honesty in academic work, and of the
      * disciplinary guidelines and procedures applicable to breaches of such policy
      * and regulations, as contained in the website
      * http://www.cuhk.edu.hk/policy/academichonesty/
      *
      * Assignment 1
      * Name : Mao Yuxuan
      * Student ID : 1155062018	
      * Email Addr : yxmao5@cse.cuhk.edu.hk
      *


       Identification Division.
       program-id. life.
       author.     michael mao.
 
       environment division.
       input-output section.
       file-control. 
           select myfile assign to 'input.txt'
             organization is line sequential
			 status is open-status.
           select outfile assign to output_file_name
             organization is line sequential.

       data division.
       file section.
       fd myfile.
       01 each-line pic x(200).
       fd outfile.
       01 out-line.
	      03 out-line-content pic x(1) occurs 1 to 102 times
		     depending on out-line-len.
         
       working-storage section.
       01 out-line-len pic 9(3).
       01 open-status pic 9(2).
       01 echo-string pic X(102).
       01 reach_file_end pic 9(1) value 0.
       01 stringtable.
          03 eachstringdata occurs 104.
             05 eachstring pic X(104).
       01 lifetable.
          03 tablerow occurs 100.
             05 tablecol pic x(1) occurs 82.
       01 checktable.
          03 checktablerow occurs 100.
             05 checktablecol pic x(1) occurs 82.
       01 access_string pic 9(3) value 0.
       01 accessrow pic 9(3) value 1.
       01 accesscol pic 9(3) value 0.
       01 linenumber pic 9(3) value 0.
       01 singlecharacter pic X(1).

       01 file_name pic x(1000).
       01 name_size pic 9(5) value 0. 
       01 iteration pic 9(5) value 0.
       01 actualrow pic 9(3) value 0.
       01 actualcol pic 9(2) value 0.
       01 findspace pic 9(1) value 0.
       01 firstend pic 9(1) value 0.
       01 secondstart pic 9(1) value 0.
       01 secondend pic 9(1) value 0.
       01 carriagereturn pic x(1) value X'0D'.
       01 countiteration pic 9(5) value 0.
       01 havenewbirth pic 9(1) value 0.
       01 havenewdied pic 9(1) value 0.
       01 tempcol pic 9(3) value 0.
       01 temprow pic 9(3) value 0.
       01 countneighbour pic 9(1) value 0.
       01 is_still_life pic 9(1) value 0.

       01 output_file_name pic x(50).
       01 suffix_name pic x(7) value 'cob.txt'.
       01 output_file_size pic 99 value 1.

       01 statement1 pic x(29)
           value 'It is a still life initially.'.
       01 statement2 pic x(40)
           value 'It is still not a still life even after '.
       01 statement3 pic x(25)
           value 'It is a still life after '.
       01 statement4 pic x(7) 
           value ' steps.'.

       01 message2 pic x(1000).
       01 message2_size pic 99 value 1.
       01 message3 pic x(1000).
       01 message3_size pic 99 value 1.

       01 count_string pic x(5).
       01 find_start pic 9(1) value 0.
       01 sublength pic 9(1) value 5.

       procedure division.
       main-paragraph.
           open input myfile 
      * error handling
		   if open-status is not = 0
		      display 'file non exist'
			  perform termination_routine
		   end-if
           perform read_input_file
           perform get_iteration
           perform store_pattern
           perform simulation
           perform write_output_file
           close myfile
           stop run.

       termination_routine.
	       close myfile
	       stop run.
      * read line by line   
       read_input_file.
           read myfile into echo-string
                at end 
                   move 1 to reach_file_end
                not at end 
                   add 1 to access_string
                   move echo-string to eachstring(access_string)
           end-read
           if reach_file_end is equal to 0
              go to read_input_file
           end-if.
      * get iteration,row,col    
       get_iteration.
	       UNSTRING eachstring(3) DELIMITED BY SPACE
                INTO actualrow, actualcol
           END-UNSTRING
		   COMPUTE iteration = FUNCTION NUMVAL(eachstring(2)).
      * store the pattern in tow table, one for processing,
      * one for record the changing position
       store_pattern.
           add 1 to accesscol
           move 3 to linenumber
           add accessrow to linenumber
           if accesscol <= actualcol
               move eachstring(linenumber)(accesscol:accesscol) 
                    to singlecharacter
			   
               if singlecharacter = '0'
                   move '0' to tablecol(accessrow, accesscol)
                   move '0' to checktablecol(accessrow, accesscol)
               end-if
               if singlecharacter = '*'
                   move '*' to tablecol(accessrow, accesscol)
                   move '0' to checktablecol(accessrow, accesscol)
               end-if
               go to store_pattern
           end-if
           
           add 1 to accessrow
           if accessrow <= actualrow
              move 0 to accesscol
              go to store_pattern 
           end-if
           
           move 0 to accessrow
           move 0 to accesscol
           move 0 to countiteration.
      
	  
      * simulate the living process
         birth_function2.
		   add 1 to accesscol
           if accessrow > 1
              move accessrow to temprow
              subtract 1 from temprow
              move accesscol to tempcol
              if tablecol(temprow, tempcol) = '*'
                 add 1 to countneighbour
              end-if
           end-if

           if accessrow > 1 and accesscol > 1
              move accessrow to temprow
              subtract 1 from temprow
              move accesscol to tempcol
              subtract 1 from tempcol
              if tablecol(temprow, tempcol) = '*'
                 add 1 to countneighbour
              end-if
           end-if

           if accessrow > 1 and accesscol < actualcol
              move accessrow to temprow
              subtract 1 from temprow
              move accesscol to tempcol
              add 1 to tempcol
              if tablecol(temprow, tempcol) = '*'
                 add 1 to countneighbour
              end-if
           end-if

           if accesscol > 1
              move accessrow to temprow
              move accesscol to tempcol
              subtract 1 from tempcol
              if tablecol(temprow, tempcol) = '*'
                 add 1 to countneighbour
              end-if
           end-if

           if accesscol < actualcol
              move accessrow to temprow
              move accesscol to tempcol
              add 1 to tempcol
              if tablecol(temprow, tempcol) = '*'
                 add 1 to countneighbour
              end-if
           end-if

           if accessrow < actualrow
              move accessrow to temprow
              add 1 to temprow
              move accesscol to tempcol
              if tablecol(temprow, tempcol) = '*'
                 add 1 to countneighbour
              end-if
           end-if

           if accessrow < actualrow and accesscol > 1
              move accessrow to temprow
              add 1 to temprow
              move accesscol to tempcol
              subtract 1 from tempcol
              if tablecol(temprow, tempcol) = '*'
                 add 1 to countneighbour
              end-if
           end-if

           if accessrow < actualrow and accesscol < actualcol
              move accessrow to temprow
              add 1 to temprow
              move accesscol to tempcol
              add 1 to tempcol
              if tablecol(temprow, tempcol) = '*'
                 add 1 to countneighbour
              end-if
           end-if

           if tablecol(accessrow, accesscol) = '0' and 
		      countneighbour = 3
              move '*' to checktablecol(accessrow, accesscol)
              move 1 to havenewbirth
           end-if

           if tablecol(accessrow, accesscol) = '*' 
              and countneighbour is not = 3
              and countneighbour is not = 2
              move '*' to checktablecol(accessrow, accesscol)
              move 1 to havenewdied
           end-if

           move 0 to countneighbour
           if accesscol < actualcol
               go to birth_function2
           end-if.   
		   
       birth_function.
           add 1 to accessrow
           move 0 to accesscol
		   perform birth_function2
           if accessrow < actualrow
               go to birth_function
           end-if
           move 0 to accessrow
           move 0 to accesscol.
      * do the update 
       update_function2.
           add 1 to accesscol

           if checktablecol(accessrow, accesscol) = '*'
              if tablecol(accessrow, accesscol) = '*'
                 move '0' to tablecol(accessrow, accesscol)
                 move '0' to checktablecol(accessrow, accesscol)
              end-if
           end-if

           if checktablecol(accessrow, accesscol) = '*'
              if tablecol(accessrow, accesscol) = '0'
                 move '*' to tablecol(accessrow, accesscol)
                 move '0' to checktablecol(accessrow, accesscol)
              end-if
           end-if

           if accesscol < actualcol
               go to update_function2
           end-if.
	   
       update_function.
           add 1 to accessrow
           move 0 to accesscol
           perform update_function2
           if accessrow < actualrow
               go to update_function
           end-if
           move 0 to accessrow
           move 0 to accesscol.
       
      * the simulation function	   
       simulation.
		   perform birth_function
           if havenewbirth = 0 and havenewdied = 0
                 move 1 to is_still_life
           end-if
           if havenewbirth = 1 or havenewdied = 1
	           move 0 to havenewbirth
	           move 0 to havenewdied
	           add 1 to countiteration

	           if countiteration <= iteration
                  perform update_function
				          go to simulation
	           end-if
           end-if.

      * process the output part
       count_name_length.
           add 1 to name_size
           move file_name(name_size:name_size) to singlecharacter 
           if singlecharacter is not = ' '
              perform count_name_length
           end-if.
       find_start_function.
           add 1 to find_start
           move count_string(find_start:find_start) 
           to singlecharacter	   
           if singlecharacter = '0'
		      subtract 1 from sublength
              go to find_start_function
           end-if.
       output_part1.
           add 1 to accessrow
           move actualcol to out-line-len
           move tablerow(accessrow)(1:actualcol) to out-line
           write out-line
           if accessrow < actualrow
              go to output_part1
           end-if.
       output_part2.
           if countiteration = 0 and is_still_life = 1
              move 29 to out-line-len
              move statement1 to out-line
              write out-line
           end-if
           if countiteration > iteration and is_still_life = 0
              string statement2 delimited by size
                 eachstring(2) delimited by space
                     statement4 delimited by size
                into message2
                with pointer message2_size
                on overflow display 'overflow!'
              end-string 
			  move message2_size to out-line-len
              subtract 1 from out-line-len
              move message2 to out-line
              write out-line
           end-if
           if countiteration > 0 and countiteration <= iteration
              and is_still_life = 1
              move countiteration to count_string
			  
              perform find_start_function
              string statement3 delimited by size
                 count_string(find_start:sublength) delimited by space
                     statement4 delimited by size
                into message3
                with pointer message3_size
                on overflow display 'overflow!'
              end-string 
			  move message3_size to out-line-len
              subtract 1 from out-line-len
              move message3 to out-line
              write out-line
           end-if.

	   

       write_output_file.
           string eachstring(1) delimited by space
                  suffix_name delimited by size
             into output_file_name
             with pointer output_file_size
             on overflow display 'overflow!'
           end-string

           open output outfile
             perform output_part1
             perform output_part2
           close outfile.
       
