using HorizonSideRobots
#Основная функция - 
function mark_frame_perimetr!(r::Robot)
    #Перемещение робота в Верхний-левый угол -
    num_vert = moves!(r, Nord)
    num_hor = moves!(r, West)

    #Маркировка периметра -
    for side in (Ost, Sud, West,Nord)
        putmarkers!(r, side)
    end 

    #Перемещение робота в исходное положение -
    moves!(r, Sud, num_vert)
    moves!(r, Ost, num_hor)

end

function moves!(r::Robot, side:: HorizonSide)
    num_of_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_of_steps+=1
    end
    return num_of_steps
end

function moves!(r::Robot,side::HorizonSide,num_of_steps::Int)
    for _ in 1:num_of_steps
        move!(r,side)
    end
end

function ismarker!(r::Robot, side:: HorizonSide)
    while isborder(r,side)==false
        if ismarker(r,side)==false
            move!(r,side)
            putmarker!(r)
        end
    end
end

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end