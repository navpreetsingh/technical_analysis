require("chartdirector")

class ChartsController < ApplicationController
    def index()
        @title = "Stock.first.stock_name"
        @noOfCharts = 1        

        stock_details = Stock.first.stocks_details
        highData = stock_details.collect(&:high)[0..30]
        
        lowData = stock_details.collect(&:low)[0..30]

        openData = stock_details.collect(&:open)[0..30]

        closeData = stock_details.collect(&:close)[0..30]

        # The labels for the CandleStick chart
        labels = stock_details.collect(&:date)[0..30]

        # Create a XYChart object of size 600 x 350 pixels
        c = ChartDirector::XYChart.new(600, 350)

        # Set the plotarea at (50, 25) and of size 500 x 250 pixels. Enable both the
        # horizontal and vertical grids by setting their colors to grey (0xc0c0c0)
        c.setPlotArea(50, 25, 500, 250).setGridColor(0xc0c0c0, 0xc0c0c0)

        # Add a title to the chart
        c.addTitle("Universal Stock Index on Jan 2001")

        # Add a custom text at (50, 25) (the upper left corner of the plotarea). Use 12
        # pts Arial Bold/blue (4040c0) as the font.
        c.addText(50, 25, Stock.first.stock_name, "arialbd.ttf", 12, 0x4040c0)

        # Add a title to the x axis
        c.xAxis().setTitle("Jan 2001")

        # Set the labels on the x axis. Rotate the labels by 45 degrees.
        c.xAxis().setLabels(labels).setFontAngle(45)

        # Add a title to the y axis
        c.yAxis().setTitle("Universal Stock Index")

        # Draw the y axis on the right hand side of the plot area
        c.setYAxisOnRight(true)

        # Add a CandleStick layer to the chart using green (00ff00) for up candles and red
        # (ff0000) for down candles
        layer = c.addCandleStickLayer(highData, lowData, openData, closeData, 0x00ff00,
            0xff0000)

        # Set the line width to 2 pixels
        layer.setLineWidth(2)

        # Output the chart
        send_data(c.makeChart2(ChartDirector::PNG), :type => "image/png",
            :disposition => "inline")
    end

end
   