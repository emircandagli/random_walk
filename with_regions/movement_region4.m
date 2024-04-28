function point = movement_region4(point)
if rand() < 0.15
    point(1) = point(1) + 1;
else
    direction = ["left", "down", "up"];
    walk = direction(randi(length(direction)));
    if walk == "left"
        point(1) = point(1) - 1;
    elseif walk == "down"
        point(2) = point(2) - 1;
    elseif walk == "up"
        point(2) = point(2) + 1;
    end
end