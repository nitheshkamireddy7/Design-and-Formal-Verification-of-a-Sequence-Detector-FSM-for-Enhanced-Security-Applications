module detector_fsm(
  input logic clk,
  input logic rst,
  input logic in,
  output logic out
);

  typedef enum logic [4:0] { 
    S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, D1, D2, D, I 
  } state;

  state present, next;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      if (present == D)
        present <= D;  // Stay in D if already in D
      else
        present <= S0;
    end 
    else begin
      present <= next;
    end
  end

  always_comb begin
    unique case (present) 
      S0: next = (in) ? D1 : S1;
      S1: next = (in) ? D1 : S2;
      S2: next = (in) ? D1 : S3;
      S3: next = (in) ? S4 : S2;
      S4: next = (in) ? D2 : S5;
      S5: next = (in) ? D1 : S6;
      S6: next = (in) ? S7 : S2;
      S7: next = (in) ? D2 : S8;
      S8: next = (in) ? S9 : S1;
      S9: next = (in) ? D2 : S10;
      S10: next = (in) ? D1 : S1;
      D1: next = (in) ? D2 : S0;
      D2: next = (in) ? D : I;
      D: next = D;
      I: next = I;
      default: next = S0;
    endcase
  end

  always_comb begin
    unique case (present)
      S10: out = in ? 0 : 1;
      default: out = 0;
    endcase
  end

endmodule
