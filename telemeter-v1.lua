--[[Description: Makes your telementer functional.

    Directions: 1. Put in system > start(). it would probably work with update() and flush() as well.
                2. Place telemeter underneath the ship.
                3. Link a landing gear and either name slot to gear_1 or ajdust gear_1 in the code
                   to match whatever you name it.
                4. Link to telemeter and name slot telemeter or adjust code to match whatever you name it.]]
                
--[[TODO: install a second telemeter and make it show information when about to collide with an object while traveling in a longitudinal direction. Give it a flashing red background when proximity to obstacle is too close when landing gear is raised.]]

--Makes information visible.
system.showScreen(1)

local function round(val, decimal)
  if (decimal) then
    return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
  else
    return math.floor(val+0.5)
  end
end

function updateDisplay()
    local dist = telemeter.getDistance()
    local roundedDist = round(dist, 2)
    
    --[[This takes into account the distance from your telemeter to the lowest point of your ship. You will need to adjust these values (and remove the if statement if you don't have landing gears) for your own ship. To do so, find the lowest point of your ship and place a layer of voxels from that point to wherever you placed your telemeter and make sure it passes underneath it. With prog board activated, change these values to reflect the distance you're given. 
    
For example, if you get 1.3 with landing gear lowered then change 2.21 to 1.3. Remove voxels when you are done.]]
    if gear_1.getState() == 1 then
    	 offsetDist = roundedDist - 2.21
    else
          offsetDist = roundedDist - 0.77
    end
    
    --Change left and top to move information to wherever you like.
    content =
    		[[<head>
    			<style>
    				p {
    					font-size: 20px;
    					color: #00FFFF;
    					width: 300px;
    				  }
    				div {
    					  font-size: 20px;
    					  position: absolute;
    					  top: 200px;
    					  left: 400px;
    					  width: 200px;
    					  align-text: center;
    				     }
    				</style>
    			</head>
    		  <body>
    			<div>
    				<p class="blink">Distance to ground: ]] .. offsetDist .. [[ meters</p>
    			</div>]]
    
    system.setScreen(content)
end