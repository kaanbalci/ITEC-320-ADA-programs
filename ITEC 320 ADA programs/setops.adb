with ada.text_io; use ada.text_io; 
with ada.integer_text_io; use ada.integer_text_io; 
with ada.float_text_io; use ada.float_text_io;

-- Main Procedure
procedure setops is
    
    value_sums : Integer := 0; -- wasn't sure how to do this, w/o global vars.
    all_sizes : Integer := 0; -- sizes added together
    value_avgs : Float := 0.0; -- value for averages added together
    largest : Integer := 0; -- previous
    largest_keep : Integer := 0; -- current
    final_second_largest : Integer := 0; -- the largest_sec_largest
    
    -- function sum_vals calculates the sum of all values in all sets
    function sum_vals(value: Integer) return Integer is
        begin
            return value_sums + value;
        end sum_vals;
        
    -- function sum_avg calculates the sum of all the avgs
    function sum_avg(value: Float) return Float is
        begin
            return value_avgs + value;
        end sum_avg;
    
    -- function largest second largest calculates the largest of all the second largest numbers
    function largest_second_largest(value: Integer; set: Integer) return Integer is
        begin
                if set = 1 then -- initialize
	                    largest_keep := value;
	                    largest := value;
	                    
                elsif value > largest then
	                largest_keep := value;
	                largest := largest_keep;
	                return largest_keep;
	                   
	            end if;

                return largest;
                
        end largest_second_largest;
                
            
        
    -- Gets Set information and calculates set average and second largest
    procedure sets(set_size, set_counter : in integer) is
        
        -- initialize varibales used in procedure sets
        x : integer;
        avg : float := 0.0;
        sum : integer := 0;
        second_largest : integer := 0;
        previous_num : integer := 0;
        current_num : integer := 0;
        is_second_largest : boolean := true;
    begin
   
        if set_size > 0 then 
            put("Set ");
   	        put(set_counter, 1);
   	        new_line;
   	        put("    Size: ");
   	        put(set_size, 1);
   	        new_line;
            for set_values in 1..set_size loop
   	            get(x);
	            sum := sum + x; -- get the sum for the set (to be used for avg)
	            -- calculate second largest number (if there is one) for set
	            if set_size /= 1 then
	                if set_values = 1 then -- initialize
	                    current_num := x;
	                    previous_num := x;
	 
	                elsif x > previous_num then
	                    previous_num := current_num;
	                    current_num := x;
	
	                elsif x < previous_num then
	                    previous_num := x;
	                    
	                end if;

	                second_largest := previous_num;
	                is_second_largest := true;
	            else
	                is_second_largest := false;
	            end if;
            end loop;

            -- calculate average for set
            avg := Float(sum)/Float(set_size);
            put("    Average: ");
            put(avg, 1, 2, 0);
            new_line;

            -- was there a second largest int? if true, print it
            if is_second_largest then
                put("    Second Largest: ");
                put(second_largest, 1);
                new_line;
                final_second_largest := largest_second_largest(second_largest, set_counter);
            end if;
        
        end if;
        -- running the functions and storing them in value_sums, all_sizes, and value_avgs
        value_sums := sum_vals(sum);
        all_sizes := all_sizes + set_size;
        value_avgs := sum_avg(avg);
    
    end sets;
    
    -- procedure named run which runs the program      
    procedure run is  
    
        -- initialize varibales for procedure run
        total_sets : integer := 0; -- var for total_sets
        EOF : integer := 1; -- End of file
        set_counter : integer := 0; -- set counter variable
        
    begin 
        get(EOF); -- get the first value
        
        if EOF = 0 then -- check if input starts with 0
            return; -- exit out of program, do not print anything
        end if;
        
    -- loop that calls procedure sets and passes in the first number and set count
    -- repeats until EOF is = 0 or the set number is negative (cannot have a negative set)

        loop
            -- exit loop when EOF is 0
            exit when EOF = 0;
                set_counter := set_counter + 1;
                sets(EOF, set_counter);
                get(EOF);
            
            -- if EOF is less then zero write prompt
            if EOF < 0 then
                put("Numbers must be non-negative for set size!");
            end if;
            
            -- if EOF equals zero then print out last three prompts with data
            if EOF = 0 then
                new_line;
                put("Average of averages: ");
                put(float(value_avgs)/float(set_counter), 1 ,2, 0);
                new_line;
                put("Largest second largest: ");
                put(final_second_largest, 1);
                new_line;
            end if;
        
        end loop;
        
    end run;
-- main procedure to run stops.
begin
    run;
end setops;
