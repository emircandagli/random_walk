clc
clear
%initialize parameters
grid_size = 10;
point = [0,0];
steps = 0;

figure;
xlim([-grid_size-1, grid_size+1]);
ylim([-grid_size-1, grid_size+1]);
xlabel('X');
ylabel('Y');
title('Simulation of Movement');
grid on;
hold on;
legend('Point');
plot_handle_healthy = plot(NaN, NaN, 'bo', 'MarkerSize', 8);
hold off;

%first, move the point until the reach the one of the regions
while (point(1) < 3) && (point(1)> -3) && (point(2) < 3) && (point(2) > -3)
    point = movement_inside(point);
    steps = steps + 1;
end
while (point(1) ~= 0) || (point(2) ~= 0)
    if (point(1) == 3 && point(2) == 3) || (point(1) == -3 && point(2) == 3) || (point(1) == 3 && point(2) == -3) || (point(1) == -3 && point(2) == -3)
        %if the point is at the intersection, all direction possibilities are equal
        point = movement_inside(point);
        steps = steps + 1;
    elseif point(1) >= -3 && point(1) <= 3 && point(2) <= 6 && point(2) >= 3
        %region 1
        point = movement_region1(point);
        steps = steps + 1;
    elseif point(1) >= 3 && point(1) <= 6 && point(2) <= 3 && point(2) >= -3
        %region 2
        point = movement_region2(point);
        steps = steps + 1;
    elseif point(1) >= -3 && point(1) <= 3 && point(2) <= -3 && point(2) >= -6
        %region 3
        point = movement_region3(point);
        steps = steps + 1;
    elseif point(1) >= -6 && point(1) <= -3 && point(2) <= 3 && point(2) >= -3
        %region 4
        point = movement_region4(point);
        steps = steps + 1;
    else
        %no region
        point = movement(point,grid_size);
        steps= steps + 1;
    end
    set(plot_handle_healthy, 'XData', point(1), 'YData', point(2));
    drawnow
    pause(0.0005)
end
fprintf("The first visit to the cell (0,0) -after the ball is in at least one of the regions- is reached in step %d.", steps);