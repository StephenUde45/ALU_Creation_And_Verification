`timescale 1ns / 1ps

module ALU_tb();
logic [3:0] A, B;
logic [2:0] Op;

logic [3:0] ALU_out;
logic overflow;

ALU inputs_and_outputs(A, B, Op, ALU_out, overflow);

// Testbench logic
    initial 
    begin
        // Randomization seed for reproducibility
        $display("Time\tOp\tA\tB\tALU_out\tOverflow");
        $monitor("%0d\t%b\t%b\t%b\t%b\t%b", $time, Op, A, B, ALU_out, overflow);

        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;

        // Run 20 randomized tests
        repeat (20) begin
            // Randomize Op, A, and B(Randomize didn't work so I used $urandom instead
            Op = $urandom % 8;  // Random 3-bit value (0 to 7)
            A = $urandom % 16;  // Random 4-bit value (0 to 15)
            B = $urandom % 16;  // Random 4-bit value (0 to 15)

            // Add a delay between operations
            #10;
        end

        $stop; // Stop simulation
    end
endmodule
