function point = movement_inside(point)
direction = ["left", "right", "up", "down"];
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