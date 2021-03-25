`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 11:32:15
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    output[2:0] TMDS_DATA_p,
    output[2:0] TMDS_DATA_n,
    output      TMDS_CLK_p,
    output      TMDS_CLK_n
    );
    
    clk_wiz_0 u2(
        .clk_in1(clk),
        .clk_out1(clk_40m),
        .clk_out2(clk_200m),
        .reset(1'b0),
        .locked(sys_rst)
    );
    
    
    wire[7:0] R,G,B;
    /*hdmi_data_gen u3(
        .pix_clk(clk_40m),
        .VGA_R(R),
        .VGA_G(G),
        .VGA_B(B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_DE(VGA_DE)
    );*/
    color_bar u4(
	    .clk(clk_40m),           //pixel clock
	    .rst(~sys_rst),           //reset signal high active
	    .hs(VGA_HS),            //horizontal synchronization
	    .vs(VGA_VS),            //vertical synchronization
	    .de(VGA_DE),            //video valid
        .rgb_r(R),         //video red data
        .rgb_g(G),         //video green data
        .rgb_b(B)          //video blue data
);
    
    
    rgb2dvi_0 u1(
        .aRst_n(sys_rst),
        .SerialClk(clk_200m),
        .PixelClk(clk_40m),
        .TMDS_Clk_p(TMDS_CLK_p),
        .TMDS_Clk_n(TMDS_CLK_n),
        .TMDS_Data_p(TMDS_DATA_p),
        .TMDS_Data_n(TMDS_DATA_n),
        .vid_pData({R,G,B}),  
        .vid_pHSync(VGA_HS),
        .vid_pVSync(VGA_VS),
        .vid_pVDE(VGA_DE)
    );
endmodule
