%Emir Can Dağlı 2517704 HW5_ID2517704_Q4_Part1
clc
clear
point = [0,0]; %define initial point as a array
grid_size_input = input("Enter the grid size (it should be an odd integer): ");
grid_size = (grid_size_input - 1) / 2;
x = input("Enter the x-coordinate of the target cell: ");
y = input("the y-coordinate of the target cell: ");
sstep = input("Enter the specific step number: ");
target = [x,y]; %define target as a array
xc = [];
yc = [];
step = 0;
while (point(1) ~= target(1)) || (point(2) ~= target(2))
    %checking if the point is at the corner or border of the grid
    if (point(1) == grid_size) && (point(2) == grid_size)  %right-top corner
        direction = ["left", "down",""];
    elseif (point(1) == -grid_size) && (point(2) == grid_size)  %left-top corner
        direction = ["right", "down"];
    elseif (point(1) == -grid_size) && (point(2) == -grid_size)  %left-bottom corner
        direction = ["right", "up"];
    elseif (point(1) == grid_size) && (point(2) == -grid_size)  %right-bottom corner
        direction = ["left", "up"];
    elseif point(1) == grid_size  %right border
        direction = ["left", "up", "down"];
    elseif point(1) == -grid_size  %left border
        direction = ["right", "up", "down"];
    elseif point(2) == grid_size  %top border
        direction = ["left", "right", "down"];
    elseif point(2) == -grid_size  %bottom border
        direction = ["left", "right", "up"];
    else  %inside the grid
        direction = ["left", "right", "up", "down"];
    end
    walk = direction(randi(length(direction)));
    %update position based on direction
    if walk == "left"
        point(1) = point(1) - 1;
    elseif walk == "right"
        point(1) = point(1) + 1;
    elseif walk == "up"
        point(2) = point(2) + 1;
    elseif walk == "down"
        point(2) = point(2) - 1;
    end
    if sstep > step %the current position is added to the xc and yc arrays until the number of steps reaches the specific step
        xc(step+1) = point(1);
        yc(step+1) = point(2);
    end
    step = step + 1;
end
if sstep > step %in order to execute the plot, determining which one is bigger, spesific step or calculated step
    sstep_interval = 1:step;
else
    sstep_interval = 1:sstep;
end
%display the total step and trajectory plots 
disp(step)
figure;
subplot(2,1,1);
plot(sstep_interval,xc);
title("x - coordinate trajectory");
xlim([1 max(sstep_interval)]);
subplot(2,1,2);
plot(sstep_interval,yc);
title("y - coordinate trajectory");
xlim([1 max(sstep_interval)]);