<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="CLKI" />
        <signal name="hsync" />
        <signal name="vsync" />
        <signal name="R(3:0)" />
        <signal name="G(3:0)" />
        <signal name="B(3:0)" />
        <port polarity="Input" name="CLKI" />
        <port polarity="Output" name="hsync" />
        <port polarity="Output" name="vsync" />
        <port polarity="Output" name="R(3:0)" />
        <port polarity="Output" name="G(3:0)" />
        <port polarity="Output" name="B(3:0)" />
        <blockdef name="hvsync">
            <timestamp>2016-9-4T5:51:31</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="clk_wiz_v3_6">
            <timestamp>2016-9-4T6:3:3</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="hvsync" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="pixel_clock" />
            <blockpin signalname="hsync" name="hsync" />
            <blockpin signalname="vsync" name="vsync" />
            <blockpin signalname="R(3:0)" name="r(3:0)" />
            <blockpin signalname="G(3:0)" name="g(3:0)" />
            <blockpin signalname="B(3:0)" name="b(3:0)" />
        </block>
        <block symbolname="clk_wiz_v3_6" name="XLXI_2">
            <blockpin signalname="CLKI" name="CLK_IN1" />
            <blockpin signalname="XLXN_1" name="CLK_OUT1" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1712" y="1456" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1152" y="1200" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1712" y1="1168" y2="1168" x1="1536" />
        </branch>
        <branch name="CLKI">
            <wire x2="1152" y1="1168" y2="1168" x1="960" />
        </branch>
        <branch name="hsync">
            <wire x2="2480" y1="1168" y2="1168" x1="2096" />
        </branch>
        <branch name="vsync">
            <wire x2="2480" y1="1232" y2="1232" x1="2096" />
        </branch>
        <branch name="R(3:0)">
            <wire x2="2480" y1="1296" y2="1296" x1="2096" />
        </branch>
        <branch name="G(3:0)">
            <wire x2="2480" y1="1360" y2="1360" x1="2096" />
        </branch>
        <branch name="B(3:0)">
            <wire x2="2480" y1="1424" y2="1424" x1="2096" />
        </branch>
        <iomarker fontsize="28" x="960" y="1168" name="CLKI" orien="R180" />
        <iomarker fontsize="28" x="2480" y="1168" name="hsync" orien="R0" />
        <iomarker fontsize="28" x="2480" y="1232" name="vsync" orien="R0" />
        <iomarker fontsize="28" x="2480" y="1296" name="R(3:0)" orien="R0" />
        <iomarker fontsize="28" x="2480" y="1360" name="G(3:0)" orien="R0" />
        <iomarker fontsize="28" x="2480" y="1424" name="B(3:0)" orien="R0" />
    </sheet>
</drawing>