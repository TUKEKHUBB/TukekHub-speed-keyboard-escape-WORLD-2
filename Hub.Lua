local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local TweenService = game:GetService("TweenService")

local animate = char:FindFirstChild("Animate")
if animate then animate.Disabled = true end

-- [[ جدول الإحداثيات المحدث ]]
local DistancesData = {
    ["250k"] = { 
        Vector3.new(-397.63, 505.01, -148.18), Vector3.new(-397.65, 505.01, -96.69), 
        Vector3.new(-397.30, 505.01, -69.52), Vector3.new(-396.22, 505.01, -31.49), 
        Vector3.new(-395.74, 504.10, -2.31), Vector3.new(-395.89, 504.10, 5.06), 
        Vector3.new(-397.70, 504.10, 48.37), Vector3.new(-399.00, 504.08, 63.80), 
        Vector3.new(-400.11, 504.10, 73.01), Vector3.new(-403.29, 504.10, 111.93), 
        Vector3.new(-401.92, 504.10, 135.23), Vector3.new(-412.14, 502.18, 190.45) 
    },
    ["400k"] = { 
        Vector3.new(-397.75, 505.01, -155.16), Vector3.new(-397.58, 505.01, -132.56), 
        Vector3.new(-396.94, 505.01, -41.18), Vector3.new(-396.62, 504.10, 3.59), 
        Vector3.new(-397.28, 504.10, 48.32), Vector3.new(-399.86, 504.10, 72.82), 
        Vector3.new(-402.68, 504.10, 113.48), Vector3.new(-400.18, 504.10, 137.43), 
        Vector3.new(-397.21, 500.18, 175.40), Vector3.new(-396.72, 500.18, 232.21), 
        Vector3.new(-396.36, 500.18, 314.88), Vector3.new(-396.58, 500.18, 350.44), 
        Vector3.new(-396.77, 500.18, 405.41), Vector3.new(-412.63, 502.18, 433.54) 
    },
    ["600k"] = {
        Vector3.new(-396.61, 500.18, 451.97), Vector3.new(-396.76, 500.04, 467.46), 
        Vector3.new(-348.07, 500.04, 468.56), Vector3.new(-347.24, 510.41, 511.97), 
        Vector3.new(-347.73, 526.90, 564.28), Vector3.new(-347.33, 527.11, 573.56), 
        Vector3.new(-443.10, 527.11, 574.26), Vector3.new(-452.77, 527.11, 574.27), 
        Vector3.new(-451.51, 529.76, 556.33), Vector3.new(-451.59, 537.04, 533.24), 
        Vector3.new(-451.70, 548.04, 498.38), Vector3.new(-451.79, 554.10, 478.49), 
        Vector3.new(-387.07, 554.11, 475.97), Vector3.new(-371.28, 554.11, 475.79), 
        Vector3.new(-356.09, 557.67, 490.41), Vector3.new(-355.77, 573.95, 541.99), 
        Vector3.new(-355.96, 580.34, 562.23), Vector3.new(-365.65, 581.18, 569.57), 
        Vector3.new(-428.96, 581.18, 569.64), Vector3.new(-439.24, 581.18, 569.39), 
        Vector3.new(-443.72, 582.45, 560.67), Vector3.new(-443.69, 590.40, 535.49), 
        Vector3.new(-443.98, 607.63, 480.88), Vector3.new(-443.70, 608.18, 476.71), 
        Vector3.new(-426.47, 608.18, 476.35), Vector3.new(-408.19, 608.18, 489.01), 
        Vector3.new(-400.11, 608.18, 586.54), Vector3.new(-399.59, 607.97, 607.35), 
        Vector3.new(-415.03, 609.90, 607.20)
    },
    ["1m"] = {
        Vector3.new(-396.61, 500.18, 451.97), Vector3.new(-396.76, 500.04, 467.46), 
        Vector3.new(-348.07, 500.04, 468.56), Vector3.new(-347.24, 510.41, 511.97), 
        Vector3.new(-347.73, 526.90, 564.28), Vector3.new(-347.33, 527.11, 573.56), 
        Vector3.new(-443.10, 527.11, 574.26), Vector3.new(-452.77, 527.11, 574.27), 
        Vector3.new(-451.51, 529.76, 556.33), Vector3.new(-451.59, 537.04, 533.24), 
        Vector3.new(-451.70, 548.04, 498.38), Vector3.new(-451.79, 554.10, 478.49), 
        Vector3.new(-387.07, 554.11, 475.97), Vector3.new(-371.28, 554.11, 475.79), 
        Vector3.new(-356.09, 557.67, 490.41), Vector3.new(-355.77, 573.95, 541.99), 
        Vector3.new(-355.96, 580.34, 562.23), Vector3.new(-365.65, 581.18, 569.57), 
        Vector3.new(-428.96, 581.18, 569.64), Vector3.new(-439.24, 581.18, 569.39), 
        Vector3.new(-443.72, 582.45, 560.67), Vector3.new(-443.69, 590.40, 535.49), 
        Vector3.new(-443.98, 607.63, 480.88), Vector3.new(-443.70, 608.18, 476.71), 
        Vector3.new(-426.47, 608.18, 476.35), Vector3.new(-408.19, 608.18, 489.01), 
        Vector3.new(-400.11, 608.18, 586.54), Vector3.new(-400.71, 607.97, 623.95), 
        Vector3.new(-401.62, 607.96, 649.06), Vector3.new(-400.10, 606.77, 672.77), 
        Vector3.new(-409.92, 600.42, 689.50), Vector3.new(-422.04, 607.97, 725.94), 
        Vector3.new(-409.69, 607.97, 768.11), Vector3.new(-402.26, 607.97, 785.84), 
        Vector3.new(-400.81, 578.72, 813.73), Vector3.new(-401.20, 607.97, 815.96), 
        Vector3.new(-401.41, 607.53, 828.75), Vector3.new(-401.07, 607.53, 840.01), 
        Vector3.new(-417.43, 609.46, 841.91)
    },
    ["1.5m"] = {
        Vector3.new(-396.61, 500.18, 451.97), Vector3.new(-396.76, 500.04, 467.46), 
        Vector3.new(-348.07, 500.04, 468.56), Vector3.new(-347.24, 510.41, 511.97), 
        Vector3.new(-347.73, 526.90, 564.28), Vector3.new(-347.33, 527.11, 573.56), 
        Vector3.new(-443.10, 527.11, 574.26), Vector3.new(-452.77, 527.11, 574.27), 
        Vector3.new(-451.51, 529.76, 556.33), Vector3.new(-451.59, 537.04, 533.24), 
        Vector3.new(-451.70, 548.04, 498.38), Vector3.new(-451.79, 554.10, 478.49), 
        Vector3.new(-387.07, 554.11, 475.97), Vector3.new(-371.28, 554.11, 475.79), 
        Vector3.new(-356.09, 557.67, 490.41), Vector3.new(-355.77, 573.95, 541.99), 
        Vector3.new(-355.96, 580.34, 562.23), Vector3.new(-365.65, 581.18, 569.57), 
        Vector3.new(-428.96, 581.18, 569.64), Vector3.new(-439.24, 581.18, 569.39), 
        Vector3.new(-443.72, 582.45, 560.67), Vector3.new(-443.69, 590.40, 535.49), 
        Vector3.new(-443.98, 607.63, 480.88), Vector3.new(-443.70, 608.18, 476.71), 
        Vector3.new(-426.47, 608.18, 476.35), Vector3.new(-408.19, 608.18, 489.01), 
        Vector3.new(-400.11, 608.18, 586.54), Vector3.new(-400.71, 607.97, 623.95), 
        Vector3.new(-401.62, 607.96, 649.06), Vector3.new(-400.10, 606.77, 672.77), 
        Vector3.new(-409.92, 600.42, 689.50), Vector3.new(-422.04, 607.97, 725.94), 
        Vector3.new(-409.69, 607.97, 768.11), Vector3.new(-402.26, 607.97, 785.84), 
        Vector3.new(-400.81, 578.72, 813.73), Vector3.new(-401.20, 607.97, 815.96), 
        Vector3.new(-401.41, 607.53, 828.75), Vector3.new(-401.07, 607.53, 840.01),
        Vector3.new(-400.55, 607.52, 858.19), Vector3.new(-400.37, 608.38, 871.36), 
        Vector3.new(-321.42, 607.52, 926.79), Vector3.new(-296.67, 607.52, 945.95), 
        Vector3.new(-297.09, 607.52, 1050.78), Vector3.new(-297.73, 607.52, 1167.67), 
        Vector3.new(-329.52, 607.52, 1200.01), Vector3.new(-399.90, 607.52, 1247.54), 
        Vector3.new(-400.01, 607.52, 1259.89), Vector3.new(-415.92, 609.45, 1261.08)
    },
    ["2m"] = {
        Vector3.new(-396.61, 500.18, 451.97), Vector3.new(-396.76, 500.04, 467.46), 
        Vector3.new(-348.07, 500.04, 468.56), Vector3.new(-347.24, 510.41, 511.97), 
        Vector3.new(-347.73, 526.90, 564.28), Vector3.new(-347.33, 527.11, 573.56), 
        Vector3.new(-443.10, 527.11, 574.26), Vector3.new(-452.77, 527.11, 574.27), 
        Vector3.new(-451.51, 529.76, 556.33), Vector3.new(-451.59, 537.04, 533.24), 
        Vector3.new(-451.70, 548.04, 498.38), Vector3.new(-451.79, 554.10, 478.49), 
        Vector3.new(-387.07, 554.11, 475.97), Vector3.new(-371.28, 554.11, 475.79), 
        Vector3.new(-356.09, 557.67, 490.41), Vector3.new(-355.77, 573.95, 541.99), 
        Vector3.new(-355.96, 580.34, 562.23), Vector3.new(-365.65, 581.18, 569.57), 
        Vector3.new(-428.96, 581.18, 569.64), Vector3.new(-439.24, 581.18, 569.39), 
        Vector3.new(-443.72, 582.45, 560.67), Vector3.new(-443.69, 590.40, 535.49), 
        Vector3.new(-443.98, 607.63, 480.88), Vector3.new(-443.70, 608.18, 476.71), 
        Vector3.new(-426.47, 608.18, 476.35), Vector3.new(-408.19, 608.18, 489.01), 
        Vector3.new(-400.11, 608.18, 586.54), Vector3.new(-400.55, 607.52, 858.19), 
        Vector3.new(-400.37, 608.38, 871.36), Vector3.new(-321.42, 607.52, 926.79), 
        Vector3.new(-296.67, 607.52, 945.95), Vector3.new(-297.09, 607.52, 1050.78), 
        Vector3.new(-297.73, 607.52, 1167.67), Vector3.new(-329.52, 607.52, 1200.01), 
        Vector3.new(-399.90, 607.52, 1247.54), Vector3.new(-400.01, 607.52, 1259.89),
        Vector3.new(-400.02, 607.53, 1279.74), Vector3.new(-399.08, 618.16, 1329.59), 
        Vector3.new(-399.23, 607.53, 1430.70), Vector3.new(-399.18, 607.53, 1458.35), 
        Vector3.new(-363.69, 628.18, 1541.76), Vector3.new(-363.98, 628.32, 1600.02), 
        Vector3.new(-363.70, 605.41, 1696.72), Vector3.new(-364.04, 605.41, 1755.52), 
        Vector3.new(-363.81, 615.65, 1787.77), Vector3.new(-399.09, 607.53, 1860.82), 
        Vector3.new(-399.26, 607.53, 1921.96), Vector3.new(-398.95, 617.80, 1954.41), 
        Vector3.new(-398.84, 607.53, 2040.52), Vector3.new(-399.05, 607.76, 2104.92), 
        Vector3.new(-399.05, 617.57, 2134.64), Vector3.new(-401.93, 607.53, 2218.21), 
        Vector3.new(-401.80, 607.53, 2278.98), Vector3.new(-402.06, 617.83, 2313.02), 
        Vector3.new(-401.59, 623.47, 2365.89), Vector3.new(-401.87, 623.47, 2387.45), 
        Vector3.new(-401.88, 623.47, 2412.27), Vector3.new(-416.51, 625.23, 2413.02)
    },
    ["4m"] = {
        Vector3.new(-396.61, 500.18, 451.97), Vector3.new(-396.76, 500.04, 467.46), 
        Vector3.new(-348.07, 500.04, 468.56), Vector3.new(-347.24, 510.41, 511.97), 
        Vector3.new(-347.73, 526.90, 564.28), Vector3.new(-347.33, 527.11, 573.56), 
        Vector3.new(-443.10, 527.11, 574.26), Vector3.new(-452.77, 527.11, 574.27), 
        Vector3.new(-451.51, 529.76, 556.33), Vector3.new(-451.59, 537.04, 533.24), 
        Vector3.new(-451.70, 548.04, 498.38), Vector3.new(-451.79, 554.10, 478.49), 
        Vector3.new(-387.07, 554.11, 475.97), Vector3.new(-371.28, 554.11, 475.79), 
        Vector3.new(-356.09, 557.67, 490.41), Vector3.new(-355.77, 573.95, 541.99), 
        Vector3.new(-355.96, 580.34, 562.23), Vector3.new(-365.65, 581.18, 569.57), 
        Vector3.new(-428.96, 581.18, 569.64), Vector3.new(-439.24, 581.18, 569.39), 
        Vector3.new(-443.72, 582.45, 560.67), Vector3.new(-443.69, 590.40, 535.49), 
        Vector3.new(-443.98, 607.63, 480.88), Vector3.new(-443.70, 608.18, 476.71), 
        Vector3.new(-426.47, 608.18, 476.35), Vector3.new(-408.19, 608.18, 489.01), 
        Vector3.new(-400.11, 608.18, 586.54), Vector3.new(-400.55, 607.52, 858.19), 
        Vector3.new(-400.37, 608.38, 871.36), Vector3.new(-321.42, 607.52, 926.79), 
        Vector3.new(-296.67, 607.52, 945.95), Vector3.new(-297.09, 607.52, 1050.78), 
        Vector3.new(-297.73, 607.52, 1167.67), Vector3.new(-329.52, 607.52, 1200.01), 
        Vector3.new(-399.90, 607.52, 1247.54), Vector3.new(-400.01, 607.52, 1259.89), 
        Vector3.new(-400.26, 607.52, 1279.01), Vector3.new(-399.08, 618.74, 1331.37), 
        Vector3.new(-399.09, 607.52, 1431.91), Vector3.new(-396.47, 607.52, 1464.51), 
        Vector3.new(-382.71, 613.43, 1495.86), Vector3.new(-369.07, 623.37, 1526.71), 
        Vector3.new(-361.10, 628.31, 1542.88), Vector3.new(-360.84, 628.31, 1600.41), 
        Vector3.new(-362.03, 605.40, 1697.40), Vector3.new(-361.09, 605.43, 1756.40), 
        Vector3.new(-361.32, 615.96, 1788.72), Vector3.new(-399.22, 607.52, 1861.88), 
        Vector3.new(-399.37, 607.89, 1924.48), Vector3.new(-398.97, 617.74, 1954.27), 
        Vector3.new(-399.16, 607.52, 2041.19), Vector3.new(-398.99, 607.52, 2101.99), 
        Vector3.new(-398.99, 617.68, 2135.00), Vector3.new(-401.58, 607.52, 2218.10), 
        Vector3.new(-401.81, 607.56, 2281.52), Vector3.new(-401.55, 617.63, 2312.42), 
        Vector3.new(-401.59, 623.46, 2366.54), Vector3.new(-401.35, 623.46, 2413.88), 
        Vector3.new(-399.28, 623.46, 2433.76), Vector3.new(-399.74, 623.42, 2465.65), 
        Vector3.new(-400.03, 623.42, 2485.41), Vector3.new(-399.09, 623.42, 2504.91), 
        Vector3.new(-398.84, 623.42, 2543.32), Vector3.new(-399.01, 623.42, 2565.01), 
        Vector3.new(-399.06, 623.42, 2585.33), Vector3.new(-398.62, 623.42, 2606.11), 
        Vector3.new(-398.72, 623.42, 2628.59), Vector3.new(-399.70, 623.41, 2647.61), 
        Vector3.new(-415.34, 625.41, 2651.18)
    },
    ["6m"] = {
        Vector3.new(-396.61, 500.18, 451.97), Vector3.new(-396.76, 500.04, 467.46), 
        Vector3.new(-348.07, 500.04, 468.56), Vector3.new(-347.24, 510.41, 511.97), 
        Vector3.new(-347.73, 526.90, 564.28), Vector3.new(-347.33, 527.11, 573.56), 
        Vector3.new(-443.10, 527.11, 574.26), Vector3.new(-452.77, 527.11, 574.27), 
        Vector3.new(-451.51, 529.76, 556.33), Vector3.new(-451.59, 537.04, 533.24), 
        Vector3.new(-451.70, 548.04, 498.38), Vector3.new(-451.79, 554.10, 478.49), 
        Vector3.new(-387.07, 554.11, 475.97), Vector3.new(-371.28, 554.11, 475.79), 
        Vector3.new(-356.09, 557.67, 490.41), Vector3.new(-355.77, 573.95, 541.99), 
        Vector3.new(-355.96, 580.34, 562.23), Vector3.new(-365.65, 581.18, 569.57), 
        Vector3.new(-428.96, 581.18, 569.64), Vector3.new(-439.24, 581.18, 569.39), 
        Vector3.new(-443.72, 582.45, 560.67), Vector3.new(-443.69, 590.40, 535.49), 
        Vector3.new(-443.98, 607.63, 480.88), Vector3.new(-443.70, 608.18, 476.71), 
        Vector3.new(-426.47, 608.18, 476.35), Vector3.new(-408.19, 608.18, 489.01), 
        Vector3.new(-400.11, 608.18, 586.54), Vector3.new(-400.55, 607.52, 858.19), 
        Vector3.new(-400.37, 608.38, 871.36), Vector3.new(-321.42, 607.52, 926.79), 
        Vector3.new(-296.67, 607.52, 945.95), Vector3.new(-297.09, 607.52, 1050.78), 
        Vector3.new(-297.73, 607.52, 1167.67), Vector3.new(-329.52, 607.52, 1200.01), 
        Vector3.new(-399.90, 607.52, 1247.54), Vector3.new(-400.01, 607.52, 1259.89), 
        Vector3.new(-400.26, 607.52, 1279.01), Vector3.new(-399.08, 618.74, 1331.37), 
        Vector3.new(-399.09, 607.52, 1431.91), Vector3.new(-396.47, 607.52, 1464.51), 
        Vector3.new(-382.71, 613.43, 1495.86), Vector3.new(-369.07, 623.37, 1526.71), 
        Vector3.new(-361.10, 628.31, 1542.88), Vector3.new(-360.84, 628.31, 1600.41), 
        Vector3.new(-362.03, 605.40, 1697.40), Vector3.new(-361.09, 605.43, 1756.40), 
        Vector3.new(-361.32, 615.96, 1788.72), Vector3.new(-399.22, 607.52, 1861.88), 
        Vector3.new(-399.37, 607.89, 1924.48), Vector3.new(-398.97, 617.74, 1954.27), 
        Vector3.new(-399.16, 607.52, 2041.19), Vector3.new(-398.99, 607.52, 2101.99), 
        Vector3.new(-398.99, 617.68, 2135.00), Vector3.new(-401.58, 607.52, 2218.10), 
        Vector3.new(-401.81, 607.56, 2281.52), Vector3.new(-401.55, 617.63, 2312.42), 
        Vector3.new(-401.59, 623.46, 2366.54), Vector3.new(-401.35, 623.46, 2413.88), 
        Vector3.new(-399.28, 623.46, 2433.76), Vector3.new(-399.74, 623.42, 2465.65), 
        Vector3.new(-400.03, 623.42, 2485.41), Vector3.new(-399.09, 623.42, 2504.91), 
        Vector3.new(-398.84, 623.42, 2543.32), Vector3.new(-399.01, 623.42, 2565.01), 
        Vector3.new(-399.06, 623.42, 2585.33), Vector3.new(-398.62, 623.42, 2606.11), 
        Vector3.new(-398.72, 623.42, 2628.59), Vector3.new(-399.70, 623.41, 2647.61),
        Vector3.new(-399.80, 623.41, 2668.09), Vector3.new(-399.78, 623.42, 2744.17), 
        Vector3.new(-399.96, 623.42, 2813.31), Vector3.new(-399.78, 623.42, 2973.40), 
        Vector3.new(-400.05, 623.42, 3087.91), Vector3.new(-399.72, 623.43, 3154.52), 
        Vector3.new(-415.05, 625.23, 3155.61)
    },
    ["10m"] = {Vector3.new(-396.61, 500.18, 451.97), Vector3.new(-396.76, 500.04, 467.46), Vector3.new(-348.07, 500.04, 468.56), Vector3.new(-347.24, 510.41, 511.97), Vector3.new(-347.73, 526.90, 564.28), Vector3.new(-347.33, 527.11, 573.56), Vector3.new(-443.10, 527.11, 574.26), Vector3.new(-452.77, 527.11, 574.27), Vector3.new(-451.51, 529.76, 556.33), Vector3.new(-451.59, 537.04, 533.24), Vector3.new(-451.70, 548.04, 498.38), Vector3.new(-451.79, 554.10, 478.49), Vector3.new(-387.07, 554.11, 475.97), Vector3.new(-371.28, 554.11, 475.79), Vector3.new(-356.09, 557.67, 490.41), Vector3.new(-355.77, 573.95, 541.99), Vector3.new(-355.96, 580.34, 562.23), Vector3.new(-365.65, 581.18, 569.57), Vector3.new(-428.96, 581.18, 569.64), Vector3.new(-439.24, 581.18, 569.39), Vector3.new(-443.72, 582.45, 560.67), Vector3.new(-443.69, 590.40, 535.49), Vector3.new(-443.98, 607.63, 480.88), Vector3.new(-443.70, 608.18, 476.71), Vector3.new(-426.47, 608.18, 476.35), Vector3.new(-408.19, 608.18, 489.01), Vector3.new(-400.11, 608.18, 586.54), Vector3.new(-400.55, 607.52, 858.19), Vector3.new(-400.37, 608.38, 871.36), Vector3.new(-321.42, 607.52, 926.79), Vector3.new(-296.67, 607.52, 945.95), Vector3.new(-297.09, 607.52, 1050.78), Vector3.new(-297.73, 607.52, 1167.67), Vector3.new(-329.52, 607.52, 1200.01), Vector3.new(-399.90, 607.52, 1247.54), Vector3.new(-400.01, 607.52, 1259.89), Vector3.new(-400.26, 607.52, 1279.01), Vector3.new(-399.08, 618.74, 1331.37), Vector3.new(-399.09, 607.52, 1431.91), Vector3.new(-396.47, 607.52, 1464.51), Vector3.new(-382.71, 613.43, 1495.86), Vector3.new(-369.07, 623.37, 1526.71), Vector3.new(-361.10, 628.31, 1542.88), Vector3.new(-360.84, 628.31, 1600.41), Vector3.new(-362.03, 605.40, 1697.40), Vector3.new(-361.09, 605.43, 1756.40), Vector3.new(-361.32, 615.96, 1788.72), Vector3.new(-399.22, 607.52, 1861.88), Vector3.new(-399.37, 607.89, 1924.48), Vector3.new(-398.97, 617.74, 1954.27), Vector3.new(-399.16, 607.52, 2041.19), Vector3.new(-398.99, 607.52, 2101.99), Vector3.new(-398.99, 617.68, 2135.00), Vector3.new(-401.58, 607.52, 2218.10), Vector3.new(-401.81, 607.56, 2281.52), Vector3.new(-401.55, 617.63, 2312.42), Vector3.new(-401.59, 623.46, 2366.54), Vector3.new(-401.35, 623.46, 2413.88), Vector3.new(-399.28, 623.46, 2433.76), Vector3.new(-399.74, 623.42, 2465.65), Vector3.new(-400.03, 623.42, 2485.41), Vector3.new(-399.09, 623.42, 2504.91), Vector3.new(-398.84, 623.42, 2543.32), Vector3.new(-399.01, 623.42, 2565.01), Vector3.new(-399.06, 623.42, 2585.33), Vector3.new(-398.62, 623.42, 2606.11), Vector3.new(-398.72, 623.42, 2628.59), Vector3.new(-399.70, 623.41, 2647.61), Vector3.new(-399.80, 623.41, 2668.09), Vector3.new(-399.78, 623.42, 2744.17), Vector3.new(-399.96, 623.42, 2813.31), Vector3.new(-399.78, 623.42, 2973.40), Vector3.new(-400.05, 623.42, 3087.91), Vector3.new(-399.72, 623.43, 3154.52), Vector3.new(-399.96, 623.43, 3173.72), Vector3.new(-400.02, 623.43, 3305.85), Vector3.new(-376.88, 623.43, 3308.52), Vector3.new(-254.70, 623.43, 3308.62), Vector3.new(-214.58, 623.43, 3308.86), Vector3.new(-168.53, 623.43, 3286.72), Vector3.new(-132.63, 623.43, 3288.18), Vector3.new(-132.39, 623.43, 3394.28), Vector3.new(-259.14, 623.43, 3394.41), Vector3.new(-293.58, 623.43, 3394.86), Vector3.new(-293.88, 623.43, 3541.47), Vector3.new(-294.33, 623.43, 3574.27), Vector3.new(-443.14, 623.43, 3655.64), Vector3.new(-511.49, 623.43, 3655.12), Vector3.new(-511.26, 623.43, 3732.19), Vector3.new(-511.51, 623.44, 3763.17), Vector3.new(-205.60, 623.44, 3763.47), Vector3.new(-149.70, 623.44, 3808.03), Vector3.new(-82.12, 623.44, 3862.34), Vector3.new(-63.61, 623.51, 3863.90), Vector3.new(-61.80, 625.23, 3880.98)},
    ["15m"] = {}, ["25m"] = {}, ["40m"] = {}, ["60m"] = {}, ["100m"] = {}, ["200m"] = {}
}

-- [ واجهة التحكم ]
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 450); frame.Position = UDim2.new(0.5, -125, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0); frame.Active = true; frame.Draggable = true

local autoWinsActive = false
local selectedDistance = nil

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0, 230, 0, 40); btn.Position = UDim2.new(0, 10, 0, 20)
btn.Text = "AUTO WINS: OFF"; btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50); btn.TextColor3 = Color3.new(1,1,1)

local speedInput = Instance.new("TextBox", frame)
speedInput.Size = UDim2.new(0, 230, 0, 40); speedInput.Position = UDim2.new(0, 10, 0, 70)
speedInput.PlaceholderText = "Enter Speed (1-200)"; speedInput.Text = "50"

local mainBtn = Instance.new("TextButton", frame)
mainBtn.Size = UDim2.new(0, 230, 0, 40); mainBtn.Position = UDim2.new(0, 10, 0, 120)
mainBtn.Text = "Select Distance"; mainBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0); mainBtn.TextColor3 = Color3.new(1,1,1)

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(0, 230, 0, 200); scroll.Position = UDim2.new(0, 10, 0, 170)
scroll.BackgroundColor3 = Color3.fromRGB(0, 100, 0); scroll.Visible = false; scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
Instance.new("UIListLayout", scroll)

mainBtn.MouseButton1Click:Connect(function() scroll.Visible = not scroll.Visible end)

local distances = {"250k", "400k", "600k", "1m", "1.5m", "2m", "4m", "6m", "10m", "15m", "25m", "40m", "60m", "100m", "200m"}
for _, name in pairs(distances) do
    local optBtn = Instance.new("TextButton", scroll)
    optBtn.Size = UDim2.new(1, 0, 0, 30); optBtn.Text = name
    optBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0); optBtn.TextColor3 = Color3.new(1,1,1)
    optBtn.MouseButton1Click:Connect(function()
        selectedDistance = name
        mainBtn.Text = name
        scroll.Visible = false
    end)
end

btn.MouseButton1Click:Connect(function()
    if not selectedDistance or not DistancesData[selectedDistance] or #DistancesData[selectedDistance] == 0 then 
        btn.Text = "SELECT VALID DISTANCE!"; task.wait(1); btn.Text = "AUTO WINS: OFF"; return 
    end
    
    autoWinsActive = not autoWinsActive
    btn.Text = autoWinsActive and "AUTO WINS: ON" or "AUTO WINS: OFF"
    
    if autoWinsActive then
        local userSpeed = tonumber(speedInput.Text) or 50
        local pointsToFollow = DistancesData[selectedDistance]
        
        task.spawn(function()
            for _, point in pairs(pointsToFollow) do
                if not autoWinsActive then break end
                local distance = (hrp.Position - point).Magnitude
                local tween = TweenService:Create(hrp, TweenInfo.new(distance / userSpeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(point)})
                tween:Play()
                tween.Completed:Wait()
            end
            autoWinsActive = false; btn.Text = "AUTO WINS: OFF"
        end)
    end
end)
