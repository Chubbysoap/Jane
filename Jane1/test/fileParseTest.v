`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2025 08:39:52 AM
// Design Name: 
// Module Name: fileParseTest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fileParseTest();

parameter NUM_MOVES = 1024;

    reg        dir [0:NUM_MOVES-1];     // 0 = R, 1 = L
    integer    steps [0:NUM_MOVES-1];

    integer    file;
    integer    i, ch, num, idx;
    reg [8*20:1] line_buffer;  // Enough for longest move like L992 (5 chars + newline)

    initial begin
        file = $fopen("moves.txt", "r");
        if (file == 0) begin
            $display("ERROR: Cannot open moves.txt");
            $finish;
        end

        i = 0;
        while (i < NUM_MOVES && !$feof(file)) begin
            // Read one line into buffer
            line_buffer = "";
            idx = 1;
            ch = $fgetc(file);

            // Read until newline or EOF
            while (ch != "\n" && ch != -1 && ch != "\r") begin
                if (idx <= 20) begin
                    line_buffer[idx*8 -: 8] = ch[7:0];  // Store byte
                    idx = idx + 1;
                end
                ch = $fgetc(file);
            end

            // Skip carriage return if present
            if (ch == "\r") ch = $fgetc(file);

            if (idx > 1) begin  // We read something
                // Parse direction: first character
                if (line_buffer[8*1 -: 8] == "R") begin
                    dir[i] = 0;
                end else if (line_buffer[8*1 -: 8] == "L") begin
                    dir[i] = 1;
                end else begin
                    $display("ERROR: Bad direction at move %0d", i);
                    $finish;
                end

                // Parse number: from second character onward
                num = 0;
                for (integer j = 2; j < idx; j = j + 1) begin
                    ch = line_buffer[8*j -: 8];
                    if (ch >= "0" && ch <= "9") begin
                        num = num * 10 + (ch - "0");
                    end else begin
                        $display("ERROR: Invalid char in number at move %0d", i);
                        $finish;
                    end
                end

                steps[i] = num;

                // Optional debug
                // $display("Move %0d: %s -> dir=%b, steps=%0d", i,
                //          (dir[i] ? "L" : "R"), dir[i], steps[i]);

                i = i + 1;
            end
        end

        $fclose(file);

        $display("Successfully parsed %0d moves.", i);

        // Show first few
        for (int j = 0; j < 10 && j < i; j = j + 1)
            $display("[%0d] %s%0d", j, dir[j] ? "L" : "R", steps[j]);

        #10 $finish;
    end

endmodule