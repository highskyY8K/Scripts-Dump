local loop = function(Times: IntValue, Function)
	for i = 1,Times do
		task.spawn(Function)
	end
end

--
while wait(1) do 
	loop(2, function()
		local args = {
			"The Light",
			vector.create(46.5, 0, -64.5),
			2
		}
		game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	end)
	
	loop(5, function()
		local args = {
			"Electric Storm",
			vector.create(36, 0, -58.5),
			3
		}
		game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	end)

	loop(3, function()
		wait(math.random(0, 5))
		local args = {
			"Ore Flattener",
			vector.create(6, 0, -58.5),
			3
		}
		game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	end)

	loop(25, function()
		local args = {
			"Synotic Fuser",
			vector.create(49.5, 0, -58.5),
			1
		}
		game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	end)

	loop(25, function()
		local args = {
			"Quantum Shine",
			vector.create(42, 0, -58.5),
			1
		}
		game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	end)
	--

	local args = {
		"Stone Excavator",
		vector.create(69, 0, -58.5),
		1
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	local args = {
		"Obsidian Drill",
		vector.create(67.5, 0, -67.5),
		0
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))

	local args = {
		"Halloween Upgrader",
		vector.create(58.5, 0, -58.5),
		1
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	local args = {
		"Beta Refiner",
		vector.create(46.5, 0, -58.5),
		0
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	local args = {
		"VIP Solar Powered Generator",
		vector.create(34.5, 0, -69),
		3
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	local args = {
		"Eggceptible Upgrader",
		vector.create(27, 0, -57),
		3
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	local args = {
		"Sunken Wreckage",
		vector.create(16.5, 0, -58.5),
		3
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	local args = {
		"Shining Blight",
		vector.create(-4.5, 0, -58.5),
		1
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	local args = {
		"Mechanical Marvel",
		vector.create(-15, 0, -58.5),
		0
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	local args = {
		"Mechanical Marvel",
		vector.create(-22.5, 0, -58.5),
		0
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("place"):InvokeServer(unpack(args))
	wait(10)
	local args = {
		"Quantum Shine",
		math.random(1, 10)
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("buy"):InvokeServer(unpack(args))
	local args = {
		"Synotic Fuser",
		math.random(1, 5)
	}
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("buy"):InvokeServer(unpack(args))
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("prestige"):FireServer()
	game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("oreLimit"):FireServer()
end
