--[[Description: Makes your telemeter functional.

    Directions: Place this code in either a chair or programming board, either way will work.
                1. Place telemeter underneath the ship.
                2. Link a landing gear and either name slot to gear_1 or ajdust gear_1 in the code
                   to match whatever you name it.
                3. Link to telemeter and name slot telemeter or adjust code to match whatever you name it.]]
                
--[[TODO: install a second telemeter and make it show information when about to collide with an object while traveling in a longitudinal direction. Give it a flashing red background when proximity to obstacle is too close when landing gear is raised.]]

--Place in system>start()
local altitude = string.format(%.2f, tostring(telemeter.getDistance()))

--Makes information visible if telemetry is available (telemeter has a max distance of 20m)

if altitude <= 20 then
    system.showScreen(1)
else
    system.showScreen(0)	
end

function updateDisplay()
    local offsetDistance = 0
    
    if gear_1.getState() == 1 then
    	 offsetDistance = altitude - 2.22
    else
          offsetDist = altitude - 0.77
    end
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

--Paste in system stop()
system.showScreen(0)

--Paste in unit tick(updateDisplay)
unit.setTimer("updateDisplay", .1)

--Paste in unit start()
updateDisplay()

--Paste in unit stop()
unit.stopTimer("updateDisplay")