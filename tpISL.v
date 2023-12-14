module TP_ISL_loteria(

   //////////// KEY //////////
   input          [3:0]    KEY,

   //////////// SW //////////
   input         [17:0]    SW,

   //////////// SEG7 //////////
   output         [6:0]    HEX0,
   output         [6:0]    HEX1,
   output         [6:0]    HEX2,
   output         [6:0]    HEX3,
   output         [6:0]    HEX4,
   output         [6:0]    HEX5,
   output         [6:0]    HEX6,
   output         [6:0]    HEX7
);


   wire clk;
   wire [3:0] num;
   wire reset;
   wire fim;
   wire fim_jogo;
   wire insere;
   reg [1:0] premio;
   reg [4:0] P1;
   reg [4:0] P2;

   reg[6:0] display0;
   reg[6:0] display1;
   reg[6:0] display2;
   reg[6:0] display3;
   reg[6:0] display4;
   reg[6:0] display5;
   reg[6:0] display6;
   reg[6:0] display7;


   assign num[0] = SW[14];
   assign num[1] = SW[15];
   assign num[2] = SW[16];
   assign num[3] = SW[17];
   assign clk = KEY[1];
   assign insere = SW[5];
   assign fim_jogo = SW[6];
   assign fim = SW[7];
   assign reset = SW[8];

   localparam INICIAL = 6'b000000,
               ESTADO1 = 6'b000001,
               ESTADO2 = 6'b000010,
               ESTADO3 = 6'b000011,
               ESTADO4 = 6'b000100,
               ESTADO5 = 6'b000101,
               ESTADO6 = 6'b000110,
               ESTADO7 = 6'b000111,
               ESTADO8 = 6'b001000,
               ESTADO9 = 6'b001001,
               ESTADO10 = 6'b001010,
               ESTADO11 = 6'b001011,
               ESTADO12 = 6'b001100,
               ESTADO13 = 6'b001101,
               ESTADO14 = 6'b001110,
               ESTADO15 = 6'b001111,
               ESTADO16 = 6'b010000,
               ESTADO17 = 6'b010001,
               ESTADO18 = 6'b010010;

   reg [5:0] estado_atual;
   reg [4:0] p1_count, p2_count;
   reg [1:0] premio_count;



   always @(posedge clk or posedge reset) begin
      if (reset) begin
         estado_atual <= ESTADO1;
         p1_count = 5'b00000;
         p2_count = 5'b00000;
         premio = 2'b00;
         display0 <=  7'b0111111;
         display1 <=  7'b0001100;
         display2 <=  7'b0111111;
         display3 <=  7'b0111111;
         display4 <=  7'b0100100;
         display5 <=  7'b0001100;
         display6 <=  7'b1111001;
         display7 <=  7'b0001100;

   end
   
   else if (fim)
      begin
   
      estado_atual <= INICIAL;

      case(P1)
    
         5'b00000: begin // 0
         display6 <= 7'b1000000;
         display7 <= 7'b1000000;
         end

         5'b00001: begin // 1
         display6 <= 7'b1111001;
         display7 <= 7'b1000000;
         end

         5'b00010: begin // 2
         display6 <= 7'b0100100;
         display7 <= 7'b1000000;
         end

         5'b00011: begin // 3
         display6 <= 7'b0110000;
         display7 <= 7'b1000000;
         end

         5'b00100: begin // 4
         display6 <= 7'b0011001;
         display7 <= 7'b1000000;
         end

         5'b00101: begin // 5
         display6 <= 7'b0010010;
         display7 <= 7'b1000000;
         end

         5'b00110: begin // 6
         display6 <= 7'b0000010;
         display7 <= 7'b1000000;
         end

         5'b00111: begin // 7
         display6 <= 7'b1111000;
         display7 <= 7'b1000000;
         end

         5'b01000: begin // 8
         display6 <= 7'b0000000;
         display7 <= 7'b1000000;
         end

         5'b01001: begin // 9
         display6 <= 7'b0010000;
         display7 <= 7'b1000000;
         end

         5'b01010: begin // 10
         display6 <= 7'b1000000;
         display7 <= 7'b1111001;
         end

         5'b01011: begin // 11
         display6 <= 7'b1111001;
         display7 <= 7'b1111001;
         end

         5'b01100: begin // 12
         display6 <= 7'b0100100;
         display7 <= 7'b1111001;
         end

         5'b01101: begin // 13
         display6 <= 7'b0110000;
         display7 <= 7'b1111001;
         end

         5'b01110: begin // 14
         display6 <= 7'b0011001;
         display7 <= 7'b1111001;
         end

         5'b01111: begin // 15
         display6 <= 7'b0010010;
         display7 <= 7'b1111001;
         end

         5'b10000: begin // 16
         display6 <= 7'b0000010;
         display7 <= 7'b1111001;
         end

         5'b10001: begin // 17
         display6 <= 7'b1111000;
         display7 <= 7'b1111001;
         end

         5'b10010: begin // 18
         display6 <= 7'b0000000;
         display7 <= 7'b1111001;
         end

         5'b10011: begin // 19
         display6 <= 7'b0010000;
         display7 <= 7'b1111001;
         end

         5'b10100: begin // 20
         display6 <= 7'b1000000;
         display7 <= 7'b0100100;
         end

         5'b10101: begin // 21
         display6 <= 7'b1111001;
         display7 <= 7'b0100100;
         end

         5'b10110: begin // 22
         display6 <= 7'b0100100;
         display7 <= 7'b0100100;
         end

         5'b10111: begin // 23
         display6 <= 7'b0110000;
         display7 <= 7'b0100100;
         end

         5'b11000: begin // 24
         display6 <= 7'b0011001;
         display7 <= 7'b0100100;
         end

         5'b11001: begin // 25
         display6 <= 7'b0010010;
         display7 <= 7'b0100100;
         end

         5'b11010: begin // 26
         display6 <= 7'b0000010;
         display7 <= 7'b0100100;
         end

         5'b11011: begin // 27
         display6 <= 7'b1111000;
         display7 <= 7'b0100100;
         end

         5'b11100: begin // 28
         display6 <= 7'b0000000;
         display7 <= 7'b0100100;
         end

         5'b11101: begin // 29
         display6 <= 7'b0010000;
         display7 <= 7'b0100100;
         end

         5'b11110: begin // 30
         display6 <= 7'b1000000;
         display7 <= 7'b0110000;
         end

         5'b11111: begin // 31
         display6 <= 7'b1111001;
         display7 <= 7'b0110000;
         end

         default: begin 
         display6 <= 7'b0100100;
         display7 <= 7'b0110000;
         end
     
   endcase

      
   case(P2)
    
      5'b00000: begin // 0
         display4 <= 7'b1000000;
         display5 <= 7'b1000000;
      end

      5'b00001: begin // 1
         display4 <= 7'b1111001;
         display5 <= 7'b1000000;
      end

      5'b00010: begin // 2
         display4 <= 7'b0100100;
         display5 <= 7'b1000000;
      end

      5'b00011: begin // 3
         display4 <= 7'b0110000;
         display5 <= 7'b1000000;
      end

      5'b00100: begin // 4
         display4 <= 7'b0011001;
         display5 <= 7'b1000000;
      end

      5'b00101: begin // 5
         display4 <= 7'b0010010;
         display5 <= 7'b1000000;
      end

      5'b00110: begin // 6
         display4 <= 7'b0000010;
         display5 <= 7'b1000000;
      end

      5'b00111: begin // 7
         display4 <= 7'b1111000;
         display5 <= 7'b1000000;
      end

      5'b01000: begin // 8
         display4 <= 7'b0000000;
         display5 <= 7'b1000000;
      end

      5'b01001: begin // 9
         display4 <= 7'b0010000;
         display5 <= 7'b1000000;
      end

      5'b01010: begin // 10
         display4 <= 7'b1000000;
         display5 <= 7'b1111001;
      end

      5'b01011: begin // 11
         display4 <= 7'b1111001;
         display5 <= 7'b1111001;
      end

      5'b01100: begin // 12
         display4 <= 7'b0100100;
         display5 <= 7'b1111001;
      end

      5'b01101: begin // 13
         display4 <= 7'b0110000;
         display5 <= 7'b1111001;
      end

      5'b01110: begin // 14
         display4 <= 7'b0011001;
         display5 <= 7'b1111001;
      end

      5'b01111: begin // 15
         display4 <= 7'b0010010;
         display5 <= 7'b1111001;
      end

      5'b10000: begin // 16
         display4 <= 7'b0000010;
         display5 <= 7'b1111001;
      end

      5'b10001: begin // 17
         display4 <= 7'b1111000;
         display5 <= 7'b1111001;
      end

      5'b10010: begin // 18
         display4 <= 7'b0000000;
         display5 <= 7'b1111001;
      end

      5'b10011: begin // 19
         display4 <= 7'b0010000;
         display5 <= 7'b1111001;
      end

      5'b10100: begin // 20
         display4 <= 7'b1000000;
         display5 <= 7'b0100100;
      end

      5'b10101: begin // 21
         display4 <= 7'b1111001;
         display5 <= 7'b0100100;
      end

      5'b10110: begin // 22
         display4 <= 7'b0100100;
         display5 <= 7'b0100100;
      end

      5'b10111: begin // 23
         display4 <= 7'b0110000;
         display5 <= 7'b0100100;
      end

      5'b11000: begin // 24
         display4 <= 7'b0011001;
         display5 <= 7'b0100100;
      end

      5'b11001: begin // 25
         display4 <= 7'b0010010;
         display5 <= 7'b0100100;
      end

      5'b11010: begin // 26
         display4 <= 7'b0000010;
         display5 <= 7'b0100100;
      end

      5'b11011: begin // 27
         display4 <= 7'b1111000;
         display5 <= 7'b0100100;
      end

      5'b11100: begin // 28
         display4 <= 7'b0000000;
         display5 <= 7'b0100100;
      end

      5'b11101: begin // 29
         display4 <= 7'b0010000;
         display5 <= 7'b0100100;
      end

      5'b11110: begin // 30
         display4 <= 7'b1000000;
         display5 <= 7'b0110000;
      end

      5'b11111: begin // 31
         display4 <= 7'b1111001;
         display5 <= 7'b0110000;
      end

      default: begin // 32
         display4 <= 7'b0100100;
         display5 <= 7'b0110000;
      end
     
   endcase
      
   end
   

   else if (fim_jogo)
      begin
   
	if (estado_atual == ESTADO16) begin
	   display0 <=  7'b1111001;
      p1_count = p1_count + 1;
	end
	 
	else if (estado_atual== ESTADO18) begin
	   display0 <=  7'b0100100;
      p2_count = p2_count + 1;
	end
	 
	else if (estado_atual==ESTADO17) begin
	   display0 <=  7'b1000000;
	end
	 
   estado_atual <= ESTADO1;
      
   end
    
   else if (insere)begin


case (estado_atual)
      default estado_atual <= INICIAL;

        INICIAL:
        if (insere) begin
            estado_atual <= INICIAL;
          end
    
        ESTADO1:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b0101) begin
                  estado_atual <= ESTADO2;
               end else begin
                  estado_atual <= ESTADO3;
               end
            end
          end

        ESTADO2:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b0111) begin
                  estado_atual <= ESTADO4;
               end else begin
                  estado_atual <= ESTADO5;
               end
            end
         end

        ESTADO3:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b0111) begin
                  estado_atual <= ESTADO6;
               end else begin
                  estado_atual <= ESTADO5;
               end
            end
         end

        ESTADO4:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b1001) begin
                  estado_atual <= ESTADO7;
               end else begin
                  estado_atual <= ESTADO8;
               end
            end
         end

        ESTADO5:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
            if (num == 4'b1001) begin
                  estado_atual <= ESTADO9;
               end else begin
                  estado_atual <= ESTADO10;
               end
            end
         end

        ESTADO6:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b1001) begin
                     estado_atual <= ESTADO11;
                  end else begin
                     estado_atual <= ESTADO10;
                  end
               end
            end

        ESTADO7:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b0011) begin
                  estado_atual <= ESTADO12;
               end else begin
                  estado_atual <= ESTADO13;
               end
            end
         end

        ESTADO8:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               estado_atual <= ESTADO14;
            end
         end

        ESTADO9:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b0011) begin
                  estado_atual <= ESTADO14;
               end else begin
                  estado_atual <= ESTADO15;
               end
            end
         end

        ESTADO10:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               estado_atual <= ESTADO15;
            end
         end

        ESTADO11:
        if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b0011) begin
                  estado_atual <= ESTADO13;
               end else begin
                  estado_atual <= ESTADO14;
               end
            end
         end

        ESTADO12:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               estado_atual <= ESTADO16;
            end
         end

        ESTADO13:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b0110) begin
                  estado_atual <= ESTADO16;
               end else begin
                  estado_atual <= ESTADO17;
               end
            end
         end

        ESTADO14:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
               if (num == 4'b0110) begin
                  estado_atual <= ESTADO18;
               end else begin
                  estado_atual <= ESTADO17;
               end
            end
         end

        ESTADO15:
         if (insere) begin
            if(num > 4'b1001) begin
               estado_atual <= estado_atual;
            end else begin
              estado_atual <= ESTADO17;
            end
         end

        ESTADO16:
          if (insere) begin
            premio = 2'b01;
          end

        ESTADO17:
          if (insere) begin
            premio = 2'b00;
          end

        ESTADO18:
            if (insere) begin
            premio = 2'b10;
          end
      endcase
    end
  begin
    
     case(estado_atual)
    
     5'b00000: begin // 0
        display2 <= 7'b1000000;
        display3 <= 7'b1000000;
     end

     5'b00001: begin // 1
        display2 <= 7'b1111001;
        display3 <= 7'b1000000;
     end

     5'b00010: begin // 2
        display2 <= 7'b0100100;
        display3 <= 7'b1000000;
     end

     5'b00011: begin // 3
        display2 <= 7'b0110000;
        display3 <= 7'b1000000;
     end

     5'b00100: begin // 4
        display2 <= 7'b0011001;
        display3 <= 7'b1000000;
     end

     5'b00101: begin // 5
        display2 <= 7'b0010010;
        display3 <= 7'b1000000;
     end

     5'b00110: begin // 6
        display2 <= 7'b0000010;
        display3 <= 7'b1000000;
     end

     5'b00111: begin // 7
        display2 <= 7'b1111000;
        display3 <= 7'b1000000;
     end

     5'b01000: begin // 8
        display2 <= 7'b0000000;
        display3 <= 7'b1000000;
     end

     5'b01001: begin // 9
        display2 <= 7'b0010000;
        display3 <= 7'b1000000;
     end

     5'b01010: begin // 10
        display2 <= 7'b1000000;
        display3 <= 7'b1111001;
     end

     5'b01011: begin // 11
        display2 <= 7'b1111001;
        display3 <= 7'b1111001;
     end

     5'b01100: begin // 12
        display2 <= 7'b0100100;
        display3 <= 7'b1111001;
     end

     5'b01101: begin // 13
        display2 <= 7'b0110000;
        display3 <= 7'b1111001;
     end

     5'b01110: begin // 14
        display2 <= 7'b0011001;
        display3 <= 7'b1111001;
     end

     5'b01111: begin // 15
        display2 <= 7'b0010010;
        display3 <= 7'b1111001;
     end

     5'b10000: begin // 16
        display2 <= 7'b0000010;
        display3 <= 7'b1111001;
     end

     5'b10001: begin // 17
        display2 <= 7'b1111000;
        display3 <= 7'b1111001;
     end

     5'b10010: begin // 18
        display2 <= 7'b0000000;
        display3 <= 7'b1111001;
     end

     default: begin // 32
        display2 <= 7'b0100100;
        display3 <= 7'b0110000;
     end
     
      endcase
   end





      premio = premio_count;
      P1 = p1_count;
      P2 = p2_count;
  end
  

   assign HEX0 = display0;
   assign HEX1 = display1;
   assign HEX2 = display2;
   assign HEX3 = display3;
   assign HEX4 = display4;
   assign HEX5 = display5;
   assign HEX6 = display6;
   assign HEX7 = display7;
  

endmodule