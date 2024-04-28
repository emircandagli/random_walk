function point = movement_region3(point)
if rand() < 0.15
    point(2) = point(2) + 1;
else
    direction = ["left", "right", "down"];
    walk = direction(randi(length(direction)));
    if walk == "left"
        point(1) = point(1) - 1;
    elseif walk == "right"
        point(1) = point(1) + 1;
    elseif walk == "down"
        point(2) = point(2) - 1;
    end
end