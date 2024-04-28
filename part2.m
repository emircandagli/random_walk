%Emir Can Dağlı 2517704 HW5_ID2517704_Q4_Part1
clc
clear
average_steps = [];
plot_x = [];
x = input("Enter the x-coordinate of the target cell: ");
y = input("the y-coordinate of the target cell: ");
target = [x,y];
for i = 5:10:95
    grid_size = (i - 1) / 2 ;
    total_steps = 0; %for every new grid size, determine the total_steps as zero
    for n = 1:500
        step = 0; %every time run the algorithm, the number of steps must be set to zero.
        point = [0,0];
        while (point(1) ~= target(1)) || (point(2) ~= target(2))
            %checking if the point is at the corner or border of the grid
            if (point(1) == grid_size) && (point(2) == grid_size)  %right-top corner
                direction = ["left", "down"];
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
            step = step + 1;
        end
        total_steps = total_steps + step;
    end
    average_steps(((i-5)/10)+1) = total_steps / 500;
    plot_x(((i-5)/10)+1) = i;
    fprintf("For N = %.d \n",i);
    fprintf("Average number of steps needed for passing the target cell is %.0f \n", average_steps(((i-5)/10)+1));
end
figure
plot(plot_x,average_steps);
xlabel("N values")
ylabel("Average number of visits")
xlim([5 95]);
set(gca, 'XTick', plot_x);