function point = movement(point,grid_size)
%checking if the point is at the corner or border of the grid
if (point(1) == grid_size) && (point(2) == grid_size)  %right-top corner
    direction = ["left", "down",];
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

