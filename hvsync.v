`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:24 08/27/2016 
// Design Name: 
// Module Name:    hvsync 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hvsync (
	// inputs:
	input wire pixel_clock,

	// outputs:
	output reg hsync,
	output reg vsync,

	//high-color test video signal
	output reg [3:0]r,
	output reg [3:0]g,
	output reg [3:0]b
	);
	
	
	// video signal parameters, default 1280x1024 75Hz (134955600 Hz pixelclock)
	parameter horz_front_porch = 16;      //H Front Porch = 0.119; (usec) = 2 chars = 16 Pixels
	parameter horz_sync = 144;            //Hor Sync Time = 1.067; (usec) = 18 chars = 144 Pixels
	parameter horz_back_porch = 248;      //H Back Porch = 1.837;  (usec) = 31 chars = 248 Pixels
	parameter horz_addr_time = 1280;
	
	parameter vert_front_porch = 1;       //V Front Porch = 0.013; (msec) = 1 lines
	parameter vert_sync = 3;              //Ver Sync Time = 0.038; (msec) = 3 lines
	parameter vert_back_porch = 38;       //V Back Porch = 0.475;  (msec) = 38 lines
	parameter vert_addr_time = 1024;
	//variables	
	reg [11:0]pixel_count = 0;
	reg [11:0]line_count = 0;

	reg hvisible = 1'b0;
	reg vvisible = 1'b0;

//synchronous process
always @(posedge pixel_clock) //горизонтальные синхроимпульсы
begin
	hsync <= (pixel_count < horz_sync);
	hvisible <= (pixel_count >= (horz_sync+horz_back_porch)) && 
		(pixel_count < (horz_sync+horz_back_porch+horz_addr_time));
	
	if(pixel_count < (horz_sync+horz_back_porch+horz_addr_time+horz_front_porch) )
		pixel_count <= pixel_count + 1'b1;
	else
		pixel_count <= 0;
end

always @(posedge hsync) //вертикальные синхроимпульсы
begin
	vsync <= (line_count < vert_sync);
	vvisible <= (line_count >= (vert_sync+vert_back_porch)) && 
		(line_count < (vert_sync+vert_back_porch+vert_addr_time));
	
	if(line_count < (vert_sync+vert_back_porch+vert_addr_time+vert_front_porch) )
		line_count <= line_count + 1'b1;
	else
		line_count <= 0;
end

wire visible; assign visible = hvisible & vvisible;
wire rvisible; assign rvisible = pixel_count[6];
wire gvisible; assign gvisible = pixel_count[7];
wire bvisible; assign bvisible = pixel_count[8];

/*always @* //Генерация цветных полос
begin
	if(visible & rvisible)
		r = pixel_count[5:2];
	else
		r = 0;

		if(visible & gvisible)
		g = pixel_count[5:2];
	else
		g = 0;

	if(visible & bvisible)
		b = pixel_count[5:2];
	else
		b = 0;
end*/

always @* //Генерация xor текстуры
begin
	if (hvisible & vvisible)
	begin
		r = (pixel_count ^ line_count) >> 6;
		g = (pixel_count ^ line_count) >> 4;
		b = (pixel_count ^ line_count) >> 2;
	end	
	else begin
		r = 0;
		g = 0;
		b = 0;
	end
end
endmodule