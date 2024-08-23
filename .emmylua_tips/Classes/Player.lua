---@class Player
local class = {}


---Returns the player's AccountID part of their full SteamID. Since this does not include other vital parts of the SteamID such as "Account Type" and "Account Instance", it should be avoided, as AccountIDs are finite, and can theoretically be the same for multiple valid accounts. See Player:SteamID for the text representation of the full SteamID. See Player:SteamID64 for a 64bit representation of the full SteamID. In a -multirun environment, this will return -1 for all "copies" of a player because they are not authenticated with Steam. For bots this will return values starting with 0 for the first bot, 1 for the second bot and so on.
---@return number
function class:AccountID() end


---This function is only available in Sandbox and its derivatives. Adds an entity to the player's clean up list. This uses cleanup. Add internally.
---@param type string
---@param ent Entity
function class:AddCleanup(type,ent) end


---This function is only available in Sandbox and its derivatives. Adds an entity to the player's list of entities of the same type. See Player:GetCount to get the current count of entities of an entity type added with this function.
---@param str string
---@param ent Entity
function class:AddCount(str,ent) end


---Adds the provided amount to the player's death count.
---@param count number
function class:AddDeaths(count) end


---Adds the provided amount to the player's frag/kill count.
---@param count number
function class:AddFrags(count) end


---Adds an entity to the player's list of frozen objects.
---@param ent Entity
---@param physobj PhysObj
function class:AddFrozenPhysicsObject(ent,physobj) end


---Sets up the voting system for the player. This is a really barebone system. By calling this a vote gets started, when the player presses 0-9 the callback function gets called along with the key the player pressed. Use the draw callback to draw the vote panel.
---@param name string
---@param timeout number
---@param vote_callback function
---@param draw_callback function
function class:AddPlayerOption(name,timeout,vote_callback,draw_callback) end


---Plays a sequence directly from a sequence number, similar to Player:AnimRestartGesture. This function has the advantage to play sequences that haven't been bound to an existing ACT enum This is not automatically networked. This function has to be called on the client to be seen by said client.
---@param slot number
---@param sequenceId number
---@param cycle number
---@param autokill boolean
function class:AddVCDSequenceToGestureSlot(slot,sequenceId,cycle,autokill) end


---Checks if the player is alive.
---@return boolean
function class:Alive() end


---Sets if the player can toggle their flashlight. Function exists on both the server and client but has no effect when ran on the client.
---@param canFlashlight boolean
function class:AllowFlashlight(canFlashlight) end


---Lets the player spray their decal without delay
---@param allow boolean
function class:AllowImmediateDecalPainting(allow) end


---Resets player gesture in selected slot.
---@param slot number
function class:AnimResetGestureSlot(slot) end


---Restart a gesture on a player, within a gesture slot. This is not automatically networked. This function has to be called on the client to be seen by said client.
---@param slot number
---@param activity number
---@param autokill boolean
function class:AnimRestartGesture(slot,activity,autokill) end


---Restarts the main animation on the player, has the same effect as calling Entity:SetCycle( 0 ).
function class:AnimRestartMainSequence() end


---Sets the sequence of the animation playing in the given gesture slot.
---@param slot number
---@param sequenceID number
function class:AnimSetGestureSequence(slot,sequenceID) end


---Sets the weight of the animation playing in the given gesture slot.
---@param slot number
---@param weight number
function class:AnimSetGestureWeight(slot,weight) end


---Returns the player's armor.
---@return number
function class:Armor() end


---Bans the player from the server for a certain amount of minutes.
---@param minutes number
---@param kick boolean
function class:Ban(minutes,kick) end


---Returns true if the player's flashlight hasn't been disabled by Player:AllowFlashlight. This is not synchronized between clients and server automatically!
---@return boolean
function class:CanUseFlashlight() end


---Prints a string to the chatbox of the client. Just like the usermessage, this function is affected by the 255 byte limit!
---@param message string
function class:ChatPrint(message) end


---Checks if the limit of an entity type added by Player:AddCount is hit or not. If it's hit, it will call the GM:PlayerCheckLimit hook, and call Player:LimitHit if the hook doesn't return false. This will always return true in singleplayer, as singleplayer does not have limits. This function is only available in Sandbox and its derivatives.
---@param str string
---@return boolean
function class:CheckLimit(str) end


---Runs the concommand on the player. This does not work on bots. If used clientside, always runs the command on the local player. If you wish to directly modify the movement input of bots, use GM:StartCommand instead. Some commands/convars are blocked from being ran/changed using this function, usually to prevent harm/annoyance to clients. For a list of blocked commands, see Blocked ConCommands.
---@param command string
function class:ConCommand(command) end


---Creates the player's death ragdoll entity and deletes the old one. This is normally used when a player dies, to create their death ragdoll. The ragdoll will be created with the player's properties such as Position, Angles, PlayerColor, Velocity and Model. You can retrieve the entity this creates with Player:GetRagdollEntity.
function class:CreateRagdoll() end


---Disables the default player's crosshair. Can be reenabled with Player:CrosshairEnable. This will affect WEAPON:DoDrawCrosshair.
function class:CrosshairDisable() end


---Enables the player's crosshair, if it was previously disabled via Player:CrosshairDisable.
function class:CrosshairEnable() end


---Returns whether the player is crouching or not (FL_DUCKING flag).
---@return boolean
function class:Crouching() end


---Returns the player's death count
---@return number
function class:Deaths() end


---Prints the players' name and position to the console.
function class:DebugInfo() end


---Detonates all tripmines belonging to the player.
function class:DetonateTripmines() end


---Disables world clicking for given player. See Panel:SetWorldClicker and Player:IsWorldClickingDisabled.
---@param disable boolean
function class:DisableWorldClicking(disable) end


---Sends a third person animation event to the player. Calls GM:DoAnimationEvent with PLAYERANIMEVENT_CUSTOM_GESTURE as the event, data as the given data.
---@param data number
function class:DoAnimationEvent(data) end


---Starts the player's attack animation. The attack animation is determined by the weapon's HoldType. Similar to other animation event functions, calls GM:DoAnimationEvent with PLAYERANIMEVENT_ATTACK_PRIMARY as the event and no extra data.
function class:DoAttackEvent() end


---Sends a specified third person animation event to the player. Calls GM:DoAnimationEvent with specified arguments.
---@param event number
---@param data number
function class:DoCustomAnimEvent(event,data) end


---Sends a third person reload animation event to the player. Similar to other animation event functions, calls GM:DoAnimationEvent with PLAYERANIMEVENT_RELOAD as the event and no extra data.
function class:DoReloadEvent() end


---Sends a third person secondary fire animation event to the player. Similar to other animation event functions, calls GM:DoAnimationEvent with PLAYERANIMEVENT_ATTACK_SECONDARY as the event and no extra data.
function class:DoSecondaryAttack() end


---Show/Hide the player's weapon's viewmodel.
---@param draw boolean
---@param vm number
function class:DrawViewModel(draw,vm) end


---Show/Hide the player's weapon's worldmodel.
---@param draw boolean
function class:DrawWorldModel(draw) end


---Drops the players' weapon of a specific class.
---@param class string
---@param target Vector
---@param velocity Vector
function class:DropNamedWeapon(class,target,velocity) end


---Drops any object the player is currently holding with either gravitygun or +Use (E key)
function class:DropObject() end


---Forces the player to drop the specified weapon
---@param weapon Weapon
---@param target Vector
---@param velocity Vector
function class:DropWeapon(weapon,target,velocity) end


---Force puts the player into a specified vehicle. This does not bypass GM:CanPlayerEnterVehicle.
---@param vehicle Vehicle
function class:EnterVehicle(vehicle) end


---Equips the player with the HEV suit. Allows the player to zoom, walk slowly, sprint, pickup armor batteries, use the health and armor stations and also shows the HUD. The player also emits a flatline sound on death, which can be overridden with GM:PlayerDeathSound. The player is automatically equipped with the suit on spawn, if you wish to stop that, use Player:RemoveSuit.
function class:EquipSuit() end


---Forces the player to exit the vehicle if they're in one. This function will bypass GM:CanExitVehicle. See also GM:PlayerLeaveVehicle
function class:ExitVehicle() end


---Enables/Disables the player's flashlight. Player:CanUseFlashlight must be true in order for the player's flashlight to be changed.
---@param isOn boolean
function class:Flashlight(isOn) end


---Returns true if the player's flashlight is on.
---@return boolean
function class:FlashlightIsOn() end


---Returns the amount of frags a player has. The value will change depending on the player's kill or suicide: +1 for a kill, -1 for a suicide.
---@return number
function class:Frags() end


---Freeze the player. Frozen players cannot move, look around, or attack. Key bindings are still called. Similar to Player:Lock but the player can still take damage. Adds or removes the FL_FROZEN flag from the player. Frozen bots will still be able to look around.
---@param frozen boolean
function class:Freeze(frozen) end


---Returns the player's active weapon. If used on a LocalPlayer() and the player is spectating another player with OBS_MODE_IN_EYE, the weapon returned will be of the spectated player.
---@return Weapon
function class:GetActiveWeapon() end


---Returns the player's current activity.
---@return number
function class:GetActivity() end


---Returns the direction that the player is aiming.
---@return Vector
function class:GetAimVector() end


---Returns true if the players' model is allowed to rotate around the pitch and roll axis.
---@return boolean
function class:GetAllowFullRotation() end


---Returns whether the player is allowed to use their weapons in a vehicle or not.
---@return boolean
function class:GetAllowWeaponsInVehicle() end


---Returns a table of all ammo the player has.
---@return table
function class:GetAmmo() end


---Gets the amount of ammo the player has.
---@param ammotype any
---@return number
function class:GetAmmoCount(ammotype) end


---Gets if the player will be pushed out of nocollided players.
---@return boolean
function class:GetAvoidPlayers() end


---Returns true if the player is able to walk using the (default) alt key.
---@return boolean
function class:GetCanWalk() end


---Determines whenever the player is allowed to use the zoom functionality.
---@return boolean
function class:GetCanZoom() end


---Returns the player's class id.
---@return number
function class:GetClassID() end


---This function is only available in Sandbox and its derivatives. Gets the total amount of entities of an entity type added by Player:AddCount. Default types: balloons buttons cameras dynamite effects emitters hoverballs lamps lights npcs props ragdolls sents thrusters vehicles wheels
---@param type string
---@param minus number
---@return number
function class:GetCount(type,minus) end


---Returns the crouched walk speed multiplier. See also Player:GetWalkSpeed and Player:SetCrouchedWalkSpeed.
---@return number
function class:GetCrouchedWalkSpeed() end


---Returns the last command which was sent by the specified player. This can only be called on the player which GetPredictionPlayer() returns. When called clientside in singleplayer during WEAPON:Think, it will return nothing as the hook is not technically predicted in that instance. See the note on the page. This will fail in GM:StartCommand. Issue Tracker: 3302
---@return CUserCmd
function class:GetCurrentCommand() end


---Gets the actual view offset which equals the difference between the players actual position and their view when standing. Do not confuse with Player:GetViewOffset and Player:GetViewOffsetDucked
---@return Vector
function class:GetCurrentViewOffset() end


---Gets the entity the player is currently driving via the drive library.
---@return Entity
function class:GetDrivingEntity() end


---Returns driving mode of the player. See Entity Driving.
---@return number
function class:GetDrivingMode() end


---Returns a player's duck speed (in seconds)
---@return number
function class:GetDuckSpeed() end


---Returns the entity the player is currently using, like func_tank mounted turrets or +use prop pickups.
---@return Entity
function class:GetEntityInUse() end


---Returns a table with information of what the player is looking at. The results of this function are cached clientside every frame. Uses util. GetPlayerTrace internally and is therefore bound by its limits. See also Player:GetEyeTraceNoCursor.
---@return table
function class:GetEyeTrace() end


---Returns the trace according to the players view direction, ignoring their mouse (holding c and moving the mouse in Sandbox). The results of this function are cached clientside every frame. Uses util. GetPlayerTrace internally and is therefore bound by its limits. See also Player:GetEyeTrace.
---@return table
function class:GetEyeTraceNoCursor() end


---Returns the FOV of the player.
---@return number
function class:GetFOV() end


---Returns the steam "relationship" towards the player.
---@return string
function class:GetFriendStatus() end


---Gets the hands entity of a player
---@return Entity
function class:GetHands() end


---Returns the widget the player is hovering with their mouse.
---@return Entity
function class:GetHoveredWidget() end


---Gets the bottom base and the top base size of the player's hull.
---@return Vector, Vector
function class:GetHull() end


---Gets the bottom base and the top base size of the player's crouch hull.
---@return Vector, Vector
function class:GetHullDuck() end


---Retrieves the value of a client-side ConVar. The ConVar must have a FCVAR_USERINFO flag for this to work. The returned value is truncated to 31 bytes. On client this function will return value of the local player, regardless of which player the function was called on!
---@param cVarName string
---@return string
function class:GetInfo(cVarName) end


---Retrieves the numeric value of a client-side convar, returns nil if value is not convertible to a number. The ConVar must have a FCVAR_USERINFO flag for this to work.
---@param cVarName string
---@param default number
---@return number
function class:GetInfoNum(cVarName,default) end


---Returns the jump power of the player
---@return number
function class:GetJumpPower() end


---Returns the player's ladder climbing speed. See Player:GetWalkSpeed for normal walking speed, Player:GetRunSpeed for sprinting speed and Player:GetSlowWalkSpeed for slow walking speed.
---@return number
function class:GetLadderClimbSpeed() end


---Returns the timescale multiplier of the player movement.
---@return number
function class:GetLaggedMovementValue() end


---Returns the maximum amount of armor the player should have. Default value is 100.
---@return number
function class:GetMaxArmor() end


---Returns the player's maximum movement speed. See also Player:SetMaxSpeed, Player:GetWalkSpeed and Player:GetRunSpeed.
---@return number
function class:GetMaxSpeed() end


---Returns the player's name, this is an alias of Player:Nick. This function overrides Entity:GetName (in the Lua metatable, not in c++), keep it in mind when dealing with ents. FindByName or any engine function which requires the mapping name.
---@return string
function class:GetName() end


---Returns whenever the player is set not to collide with their teammates.
---@return boolean
function class:GetNoCollideWithTeammates() end


---Returns the the observer mode of the player
---@return number
function class:GetObserverMode() end


---Returns the entity the player is currently observing. Set using Player:SpectateEntity.
---@return Entity
function class:GetObserverTarget() end


---Returns a Persistent Data key-value pair from the SQL database. (sv. db when called on server, cl. db when called on client) Internally uses the sql library. See util. GetPData for cases when the player is not currently on the server. This function internally uses Player:SteamID64, it previously utilized Player:UniqueID which can cause collisions (two or more players sharing the same PData entry). Player:SetPData now replaces all instances of Player:UniqueID with Player:SteamID64 when running Player:SetPDataPData is not networked from servers to clients!
---@param key string
---@param default any
---@return string
function class:GetPData(key,default) end


---Returns a player model's color. The part of the model that is colored is determined by the model itself, and is different for each model. Overide this function clientside on a Entity(not a player) with playermodel and return color will apply color on it
---@return Vector
function class:GetPlayerColor() end


---Returns a table containing player information.
---@return table
function class:GetPlayerInfo() end


---Returns the preferred carry angles of an object, if any are set. Calls GM:GetPreferredCarryAngles with the target entity and returns the carry angles.
---@param carryEnt Entity
---@return Angle
function class:GetPreferredCarryAngles(carryEnt) end


---Returns the widget entity the player is using. Having a pressed widget stops the player from firing their weapon to allow input to be passed onto the widget.
---@return Entity
function class:GetPressedWidget() end


---Returns the weapon the player previously had equipped.
---@return Entity
function class:GetPreviousWeapon() end


---We advise against using this. It may be changed or removed in a future update. You should use Player:GetViewPunchAngles instead. Returns players screen punch effect angle. See Player:ViewPunch and Player:SetViewPunchAngles
---@return Angle
function class:GetPunchAngle() end


---Returns players death ragdoll. The ragdoll is created by Player:CreateRagdoll. Calling Entity:GetPos server-side with this function then will return the position when Player:CreateRagdoll was used.
---@return Entity
function class:GetRagdollEntity() end


---Returns the render angles for the player.
---@return Angle
function class:GetRenderAngles() end


---Returns the player's sprint speed. See also Player:SetRunSpeed, Player:GetWalkSpeed and Player:GetMaxSpeed.
---@return number
function class:GetRunSpeed() end


---Returns the position of a Player's view This is the same as calling Entity:EyePos on the player.
---@return Vector
function class:GetShootPos() end


---Returns the player's slow walking speed, which is activated via +walk keybind. See Player:GetWalkSpeed for normal walking speed, Player:GetRunSpeed for sprinting speed and Player:GetLadderClimbSpeed for ladder climb speed.
---@return number
function class:GetSlowWalkSpeed() end


---Returns the maximum height player can step onto.
---@return number
function class:GetStepSize() end


---Returns the player's HEV suit power. This will only work for the local player when used clientside. Issue Tracker: 3449
---@return number
function class:GetSuitPower() end


---Returns the number of seconds that the player has been timing out for. You can check if a player is timing out with Player:IsTimingOut. This function is relatively useless because it is tied to the value of the sv_timeout ConVar, which is irrelevant to the description above. This is not considered as a bug.
---@return number
function class:GetTimeoutSeconds() end


---Returns TOOL table of players current tool, or of the one specified.
---@param mode string
---@return table
function class:GetTool(mode) end


---Returns a player's unduck speed (in seconds)
---@return number
function class:GetUnDuckSpeed() end


---Returns the entity the player would use if they would press their +use keybind. Because entity physics objects usually do not exist on the client, the client's use entity will resolve to whatever the crosshair is placed on within a little less than 72 units of the player's eye position. This differs from the entity returned by the server, which has fully physical use checking. See util. TraceHull. Issue tracker: 5027
---@return Entity
function class:GetUseEntity() end


---Returns the player's user group. By default, player user groups are loaded from garrysmod/settings/users. txt.
---@return string
function class:GetUserGroup() end


---Gets the vehicle the player is driving, returns NULL ENTITY if the player is not driving.
---@return Vehicle
function class:GetVehicle() end


---Returns the entity the player is using to see from (such as the player itself, the camera, or another entity). This function will return a [NULL Entity] until Player:SetViewEntity has been used
---@return Entity
function class:GetViewEntity() end


---Returns the player's view model entity by the index. Each player has 3 view models by default, but only the first one is used. To use the other viewmodels in your SWEP, see Entity:SetWeaponModel. In the Client realm, other players' viewmodels are not available unless they are being spectated.
---@param index number
---@return Entity
function class:GetViewModel(index) end


---Returns the view offset of the player which equals the difference between the players actual position and their view. See also Player:GetViewOffsetDucked.
---@return Vector
function class:GetViewOffset() end


---Returns the view offset of the player which equals the difference between the players actual position and their view when ducked. See also Player:GetViewOffset.
---@return Vector
function class:GetViewOffsetDucked() end


---Returns players screen punch effect angle.
---@return Angle
function class:GetViewPunchAngles() end


---Returns client's view punch velocity. See Player:ViewPunch and Player:SetViewPunchVelocity
---@return Angle
function class:GetViewPunchVelocity() end


---Returns the current voice volume scale for given player on client.
---@return number
function class:GetVoiceVolumeScale() end


---Returns the player's normal walking speed. Not sprinting, not slow walking. (+walk) See also Player:SetWalkSpeed, Player:GetMaxSpeed and Player:GetRunSpeed.
---@return number
function class:GetWalkSpeed() end


---Returns the weapon for the specified class
---@param className string
---@return Weapon
function class:GetWeapon(className) end


---Returns a player's weapon color. The part of the model that is colored is determined by the model itself, and is different for each model. The format is Vector(r,g,b), and each color should be between 0 and 1.
---@return Vector
function class:GetWeaponColor() end


---Returns a table of the player's weapons. This function returns a sequential table. Prefer to loop it with ipairs instead of the pairs function.
---@return table
function class:GetWeapons() end


---Gives the player a weapon. While this function is meant for weapons/pickupables only, it is not restricted to weapons. Any entity can be spawned using this function, including NPCs and SENTs.
---@param weaponClassName string
---@param bNoAmmo boolean
---@return Weapon
function class:Give(weaponClassName,bNoAmmo) end


---Gives ammo to a player
---@param amount number
---@param type any
---@param hidePopup boolean
---@return number
function class:GiveAmmo(amount,type,hidePopup) end


---Disables god mode on the player.
function class:GodDisable() end


---Enables god mode on the player.
function class:GodEnable() end


---Returns whether the player has god mode or not, contolled by Player:GodEnable and Player:GodDisable.
---@return boolean
function class:HasGodMode() end


---Returns if the player has the specified weapon
---@param className string
---@return boolean
function class:HasWeapon(className) end


---Returns if the player is in a vehicle
---@return boolean
function class:InVehicle() end


---Returns the player's IP address and connection port in ip:port form Returns Error! for bots.
---@return string
function class:IPAddress() end


---Returns whether the player is an admin or not. It will also return true if the player is Player:IsSuperAdmin by default. Internally this is determined by Player:IsUserGroup.
---@return boolean
function class:IsAdmin() end


---Returns if the player is an bot or not
---@return boolean
function class:IsBot() end


---Returns true from the point when the player is sending client info but not fully in the game until they disconnect.
---@return boolean
function class:IsConnected() end


---Used to find out if a player is currently 'driving' an entity (by which we mean 'right click > drive' ).
---@return boolean
function class:IsDrivingEntity() end


---Returns whether the players movement is currently frozen, controlled by Player:Freeze.
---@return boolean
function class:IsFrozen() end


---Returns whether the player identity was confirmed by the steam network. See also GM:PlayerAuthed.
---@return boolean
function class:IsFullyAuthenticated() end


---Returns if a player is the host of the current session.
---@return boolean
function class:IsListenServerHost() end


---Returns whether or not the player is muted locally.
---@return boolean
function class:IsMuted() end


---Returns true if the player is playing a taunt.
---@return boolean
function class:IsPlayingTaunt() end


---Returns whenever the player is heard by the local player clientside, or if the player is speaking serverside.
---@return boolean
function class:IsSpeaking() end


---Returns whether the player is currently sprinting or not, specifically if they are holding their sprint key and are allowed to sprint. This will not check if the player is currently sprinting into a wall. (i. e. holding their sprint key but not moving)
---@return boolean
function class:IsSprinting() end


---Returns whenever the player is equipped with the suit item. This will only work for the local player when used clientside. Issue Tracker: 3449
---@return boolean
function class:IsSuitEquipped() end


---Returns whether the player is a super admin. Internally this is determined by Player:IsUserGroup. See also Player:IsAdmin.
---@return boolean
function class:IsSuperAdmin() end


---Returns true if the player is timing out (i. e. is losing connection), false otherwise. A player is considered timing out when more than 4 seconds has elapsed since a network packet was received from given player.
---@return boolean
function class:IsTimingOut() end


---Returns whether the player is typing in their chat. This may not work properly if the server uses a custom chatbox.
---@return boolean
function class:IsTyping() end


---Returns true/false if the player is in specified group or not. See Player:GetUserGroup for a way to get player's usergroup.
---@param groupname string
---@return boolean
function class:IsUserGroup(groupname) end


---Returns if the player can be heard by the local player.
---@return boolean
function class:IsVoiceAudible() end


---Returns if the player currently walking. (+walk keybind)
---@return boolean
function class:IsWalking() end


---Returns whether the player is using the world clicking feature, see Panel:SetWorldClicker
---@return boolean
function class:IsWorldClicking() end


---Returns whether the world clicking is disabled for given player or not. See Player:DisableWorldClicking.
---@return boolean
function class:IsWorldClickingDisabled() end


---Returns whether a key is down. This is not networked to other players, meaning only the local client can see the keys they are pressing.
---@param key number
---@return boolean
function class:KeyDown(key) end


---Gets whether a key was down one tick ago.
---@param key number
---@return boolean
function class:KeyDownLast(key) end


---Gets whether a key was just pressed this tick.
---@param key number
---@return boolean
function class:KeyPressed(key) end


---Gets whether a key was just released this tick.
---@param key number
---@return boolean
function class:KeyReleased(key) end


---Kicks the player from the server. This can not be run before the player has fully joined in. Use game. KickID for that.
---@param reason string
function class:Kick(reason) end


---Kills a player and calls GM:PlayerDeath.
function class:Kill() end


---Kills a player without notifying the rest of the server. This will call GM:PlayerSilentDeath instead of GM:PlayerDeath.
function class:KillSilent() end


---This allows the server to mitigate the lag of the player by moving back all the entities that can be lag compensated to the time the player attacked with his weapon. This technique is most commonly used on things that hit other entities instantaneously, such as traces. Entity:FireBullets calls this function internally. Lag compensation only works for players and entities that have been enabled with Entity:SetLagCompensated Despite being defined shared, it can only be used server-side in a Predicted Hook. This function NEEDS to be disabled after you're done with it or it will break the movement of the entities affected!Lag compensation does not support pose parameters. Issue Tracker: 3683
---@param lagCompensation boolean
function class:LagCompensation(lagCompensation) end


---Returns the hitgroup where the player was last hit.
---@return number
function class:LastHitGroup() end


---Shows "limit hit" notification in sandbox. This function is only available in Sandbox and its derivatives.
---@param type string
function class:LimitHit(type) end


---Returns the direction a player is looking as a entity/local-oriented angle. Unlike Entity:EyeAngles, this function does not include angles of the Player's Entity:GetParent.
---@return Angle
function class:LocalEyeAngles() end


---Stops a player from using any inputs, such as moving, turning, or attacking. Key binds are still called. Similar to Player:Freeze but the player takes no damage. Adds the FL_FROZEN and FL_GODMODE flags to the player. Frozen bots will still be able to look around.
function class:Lock() end


---Returns the position of a Kinect bone.
---@param bone number
---@return Vector
function class:MotionSensorPos(bone) end


---Returns the players name. Identical to Player:Nick and Player:GetName.
---@return string
function class:Name() end


---Returns the player's nickname.
---@return string
function class:Nick() end


---Returns the 64-bit SteamID aka CommunityID of the Steam Account that owns the Garry's Mod license this player is using. This is useful for detecting players using Steam Family Sharing. If player is not using Steam Family Sharing, this will return the player's actual SteamID64(). This data will only be available after the player has fully authenticated with Steam. See Player:IsFullyAuthenticated.
---@return string
function class:OwnerSteamID64() end


---Returns the packet loss of the client. It is not networked so it only returns 0 when run clientside.
---@return number
function class:PacketLoss() end


---Unfreezes the props player is looking at. This is essentially the same as pressing reload with the physics gun, including double press for unfreeze all.
---@return number
function class:PhysgunUnfreeze() end


---This makes the player hold ( same as pressing e on a small prop ) the provided entity. Don't get this confused with picking up items like ammo or health kitsThis picks up the passed entity regardless of its mass or distance from the player
---@param entity Entity
function class:PickupObject(entity) end


---Forces the player to pickup an existing weapon entity. The player will not pick up the weapon if they already own a weapon of given type, or if the player could not normally have this weapon in their inventory. This function will bypass GM:PlayerCanPickupWeapon.
---@param wep Weapon
---@param ammoOnly boolean
---@return boolean
function class:PickupWeapon(wep,ammoOnly) end


---Returns the player's ping to server.
---@return number
function class:Ping() end


---Plays the correct step sound according to what the player is staying on.
---@param volume number
function class:PlayStepSound(volume) end


---Displays a message either in their chat, console, or center of the screen. See also PrintMessage. When called serverside, this uses the archaic user message system (the umsg) and hence is limited to ¡Ö250 characters. HUD_PRINTCENTER will not work when this is called clientside.
---@param type number
---@param message string
function class:PrintMessage(type,message) end


---Removes all ammo from a certain player
function class:RemoveAllAmmo() end


---Removes all weapons and ammo from the player.
function class:RemoveAllItems() end


---Removes the amount of the specified ammo from the player.
---@param ammoCount number
---@param ammoName string
function class:RemoveAmmo(ammoCount,ammoName) end


---Removes a Persistent Data key-value pair from the SQL database. (sv. db when called on server, cl. db when called on client) Internally uses the sql library. See util. RemovePData for cases when the player is not currently on the server. This function internally uses Player:SteamID64, it previously utilized Player:UniqueID which can cause collisions (two or more players sharing the same PData entry). Player:SetPData now replaces all instances of Player:UniqueID with Player:SteamID64 when running Player:SetPDataPData is not networked from servers to clients!
---@param key string
---@return boolean
function class:RemovePData(key) end


---Strips the player's suit item.
function class:RemoveSuit() end


---Resets both normal and duck hulls to their default values.
function class:ResetHull() end


---Forces the player to say whatever the first argument is. Works on bots too. This function ignores the default chat message cooldown
---@param text string
---@param teamOnly boolean
function class:Say(text,teamOnly) end


---Fades the screen
---@param flags number
---@param clr number
---@param fadeTime number
---@param fadeHold number
function class:ScreenFade(flags,clr,fadeTime,fadeHold) end


---Sets the active weapon of the player by its class name. This will switch the weapon out of prediction, causing delay on the client and WEAPON:Deploy and WEAPON:Holster to be called out of prediction. Try using CUserCmd:SelectWeapon or input. SelectWeapon, instead. This will trigger the weapon switch event and associated animations. To switch weapons silently, use Player:SetActiveWeapon.
---@param className string
function class:SelectWeapon(className) end


---Sends a hint to a player. This function is only available in Sandbox and its derivatives. Since this adds #Hint_ to the beginning of each message, you should only use it with default hint messages, or those cached with language. Add. For hints with custom text, look at notification. AddLegacy.
---@param name string
---@param delay number
function class:SendHint(name,delay) end


---Executes a simple Lua string on the player. If you need to use this function more than once consider using net library. Send net message and make the entire code you want to execute in net. Receive on client. The string is limited to 254 bytes. Consider using the net library for more advanced server-client interaction.
---@param script string
function class:SendLua(script) end


---Sets the player's active weapon. You should use CUserCmd:SelectWeapon or Player:SelectWeapon, instead in most cases. This function will not trigger the weapon switch events or associated equip animations. It will bypass GM:PlayerSwitchWeapon and the currently active weapon's WEAPON:Holster return value.
---@param weapon Weapon
function class:SetActiveWeapon(weapon) end


---Sets the player's activity.
---@param act number
function class:SetActivity(act) end


---Set if the players' model is allowed to rotate around the pitch and roll axis.
---@param Allowed boolean
function class:SetAllowFullRotation(Allowed) end


---Allows player to use their weapons in a vehicle. You need to call this before entering a vehicle. Shooting in a vehicle fires two bullets. Issue Tracker: 1277
---@param allow boolean
function class:SetAllowWeaponsInVehicle(allow) end


---Sets the amount of the specified ammo for the player.
---@param ammoCount number
---@param ammoType any
function class:SetAmmo(ammoCount,ammoType) end


---Sets the player armor to the argument.
---@param Amount number
function class:SetArmor(Amount) end


---Pushes the player away from other players whenever the player inside another players' bounding box. This avoidance is performed clientside by altering movement sent to server. This applies to players within a single team. (Player:Team)
---@param avoidPlayers boolean
function class:SetAvoidPlayers(avoidPlayers) end


---Set if the player should be allowed to walk using the (default) alt key.
---@param abletowalk boolean
function class:SetCanWalk(abletowalk) end


---Sets whether the player can use the HL2 suit zoom ("+zoom" bind) or not.
---@param canZoom boolean
function class:SetCanZoom(canZoom) end


---Sets the player's class id.
---@param classID number
function class:SetClassID(classID) end


---Sets the crouched walk speed multiplier. Doesn't work for values above 1. See also Player:SetWalkSpeed and Player:GetCrouchedWalkSpeed.
---@param speed number
function class:SetCrouchedWalkSpeed(speed) end


---Sets the actual view offset which equals the difference between the players actual position and their view when standing. Do not confuse with Player:SetViewOffset and Player:SetViewOffsetDucked
---@param viewOffset Vector
function class:SetCurrentViewOffset(viewOffset) end


---Sets a player's death count
---@param deathcount number
function class:SetDeaths(deathcount) end


---This is used internally - although you're able to use it you probably shouldn't. Sets the driving entity and driving mode. Use drive. PlayerStartDriving instead, see Entity Driving.
---@param drivingEntity Entity
---@param drivingMode number
function class:SetDrivingEntity(drivingEntity,drivingMode) end


---Activates a given DSP (Digital Signal Processor) effect on all sounds that the player hears. To apply a DSP effect to individual sounds, see CSoundPatch:SetDSP
---@param dspEffectId number
---@param fastReset boolean
function class:SetDSP(dspEffectId,fastReset) end


---Sets how quickly a player ducks. This will not work for values >= 1. Issue Tracker: 2722
---@param duckSpeed number
function class:SetDuckSpeed(duckSpeed) end


---Sets the local angle of the player's view (may rotate body too if angular difference is large)
---@param angle Angle
function class:SetEyeAngles(angle) end


---Set a player's FOV (Field Of View) over a certain amount of time. This is meant to be called on the server or shared (for prediction), it will have no effect if called clientside only. You may want to use GM:CalcView for that instead.
---@param fov number
---@param time number
---@param requester Entity
function class:SetFOV(fov,time,requester) end


---Sets a player's frags (kills)
---@param fragcount number
function class:SetFrags(fragcount) end


---Sets the hands entity of a player. The hands entity is an entity introduced in Garry's Mod 13 and it's used to show the player's hands attached to the viewmodel. This is similar to the approach used in L4D and CS:GO, for more information on how to implement this system in your gamemode visit Using Viewmodel Hands.
---@param hands Entity
function class:SetHands(hands) end


---Sets the widget that is currently hovered by the player's mouse.
---@param widget Entity
function class:SetHoveredWidget(widget) end


---Sets the mins and maxs of the AABB of the players collision. See Player:SetHullDuck for the hull while crouching/ducking. Not replicated, need to be call on server and client.
---@param hullMins Vector
---@param hullMaxs Vector
function class:SetHull(hullMins,hullMaxs) end


---Sets the mins and maxs of the AABB of the players collision when ducked. See Player:SetHull for setting the hull while standing. Not replicated, need to be call on server and client.
---@param hullMins Vector
---@param hullMaxs Vector
function class:SetHullDuck(hullMins,hullMaxs) end


---Sets the jump power, eg. the velocity that will be applied to the player when they jump.
---@param jumpPower number
function class:SetJumpPower(jumpPower) end


---Sets the player's ladder climbing speed. See Player:SetWalkSpeed for normal walking speed, Player:SetRunSpeed for sprinting speed and Player:SetSlowWalkSpeed for slow walking speed.
---@param speed number
function class:SetLadderClimbSpeed(speed) end


---Slows down the player movement simulation by the timescale, this is used internally in the HL2 weapon stripping sequence. It achieves such behavior by multiplying the FrameTime by the specified timescale at the start of the movement simulation and then restoring it afterwards. This is reset to 1 on spawn. There is no weapon counterpart to this, you'll have to hardcode the multiplier in the weapon or call Weapon:SetNextPrimaryFire / Weapon:SetNextSecondaryFire manually.
---@param timescale number
function class:SetLaggedMovementValue(timescale) end


---Sets the hitgroup where the player was last hit.
---@param hitgroup number
function class:SetLastHitGroup(hitgroup) end


---Sets the maximum amount of armor the player should have. This affects default built-in armor pickups, but not Player:SetArmor.
---@param maxarmor number
function class:SetMaxArmor(maxarmor) end


---Sets the maximum speed which the player can move at. This is called automatically by the engine. If you wish to limit player speed without setting their run/sprint speeds, see CMoveData:SetMaxClientSpeed.
---@param walkSpeed number
function class:SetMaxSpeed(walkSpeed) end


---Sets if the player should be muted locally.
---@param mute boolean
function class:SetMuted(mute) end


---Sets whenever the player should not collide with their teammates, based on their Player:Team. This will only work for teams with ID 1 to 4 due to internal Engine limitations. This causes traces with COLLISION_GROUP_PLAYER to pass through players.
---@param shouldNotCollide boolean
function class:SetNoCollideWithTeammates(shouldNotCollide) end


---Sets the players visibility towards NPCs. Internally this toggles the FL_NOTARGET flag, which you can manually test for using Entity:IsFlagSet
---@param visibility boolean
function class:SetNoTarget(visibility) end


---Sets the players observer mode. You must start the spectating first with Player:Spectate.
---@param mode number
function class:SetObserverMode(mode) end


---Writes a Persistent Data key-value pair to the SQL database. (sv. db when called on server, cl. db when called on client) Internally uses the sql library. See util. SetPData for cases when the player is not currently on the server. This function internally uses Player:SteamID64, it previously utilized Player:UniqueID which can cause collisions (two or more players sharing the same PData entry). Player:SetPData now replaces all instances of Player:UniqueID with Player:SteamID64 when running Player:SetPDataPData is not networked from servers to clients!
---@param key string
---@param value any
---@return boolean
function class:SetPData(key,value) end


---Sets the player model's color. The part of the model that is colored is determined by the model itself, and is different for each model.
---@param Color Vector
function class:SetPlayerColor(Color) end


---Sets the widget that is currently in use by the player's mouse. Having a pressed widget stops the player from firing their weapon to allow input to be passed onto the widget.
---@param pressedWidget Entity
function class:SetPressedWidget(pressedWidget) end


---Sets the render angles of a player. Value set by this function is reset to player's angles (Entity:GetAngles) right after GM:UpdateAnimation.
---@param ang Angle
function class:SetRenderAngles(ang) end


---Sets the player's sprint speed. See also Player:GetRunSpeed, Player:SetWalkSpeed and Player:SetMaxSpeed. player_default class run speed is: 240
---@param runSpeed number
function class:SetRunSpeed(runSpeed) end


---Sets the player's slow walking speed, which is activated via +walk keybind. See Player:SetWalkSpeed for normal walking speed, Player:SetRunSpeed for sprinting speed and Player:SetLadderClimbSpeed for ladder climb speed.
---@param speed number
function class:SetSlowWalkSpeed(speed) end


---Sets the maximum height a player can step onto without jumping.
---@param stepHeight number
function class:SetStepSize(stepHeight) end


---Sets the player's HEV suit power. This will only work for the local player when used clientside. Issue Tracker: 3449
---@param power number
function class:SetSuitPower(power) end


---Sets whenever to suppress the pickup notification for the player.
---@param doSuppress boolean
function class:SetSuppressPickupNotices(doSuppress) end


---Sets the player to the chosen team.
---@param Team number
function class:SetTeam(Team) end


---Sets how quickly a player un-ducks
---@param UnDuckSpeed number
function class:SetUnDuckSpeed(UnDuckSpeed) end


---Sets up the players view model hands. Calls GM:PlayerSetHandsModel to set the model of the hands.
---@param ent Entity
function class:SetupHands(ent) end


---Sets the usergroup of the player.
---@param groupName string
function class:SetUserGroup(groupName) end


---Attaches the players view to the position and angles of the specified entity.
---@param viewEntity Entity
function class:SetViewEntity(viewEntity) end


---Sets the desired view offset which equals the difference between the players actual position and their view when standing. If you want to set actual view offset, use Player:SetCurrentViewOffset See also Player:SetViewOffsetDucked for desired view offset when crouching.
---@param viewOffset Vector
function class:SetViewOffset(viewOffset) end


---Sets the desired view offset which equals the difference between the players actual position and their view when crouching. If you want to set actual view offset, use Player:SetCurrentViewOffset See also Player:SetViewOffset for desired view offset when standing.
---@param viewOffset Vector
function class:SetViewOffsetDucked(viewOffset) end


---Sets client's view punch angle, but not the velocity. See Player:ViewPunch
---@param punchAngle Angle
function class:SetViewPunchAngles(punchAngle) end


---Sets client's view punch velocity. See Player:ViewPunch and Player:SetViewPunchAngles
---@param punchVel Angle
function class:SetViewPunchVelocity(punchVel) end


---Sets the voice volume scale for given player on client. This value will persist from server to server, but will be reset when the game is shut down. This doesn't work on bots, their scale will always be 1.
---@param unname_value number
function class:SetVoiceVolumeScale(unname_value) end


---Sets the player's normal walking speed. Not sprinting, not slow walking +walk. See also Player:SetSlowWalkSpeed, Player:GetWalkSpeed, Player:SetCrouchedWalkSpeed, Player:SetMaxSpeed and Player:SetRunSpeed. Using a speed of 0 can lead to prediction errors. Issue Tracker: 2030player_default class walk speed is: 160.
---@param walkSpeed number
function class:SetWalkSpeed(walkSpeed) end


---Sets the player weapon's color. The part of the model that is colored is determined by the model itself, and is different for each model.
---@param Color Vector
function class:SetWeaponColor(Color) end


---Returns whether the player's player model will be drawn at the time the function is called.
---@return boolean
function class:ShouldDrawLocalPlayer() end


---Sets whether the player's current weapon should drop on death. This is reset on spawn to the player class's DropWeaponOnDie field by player_manager. OnPlayerSpawn.
---@param drop boolean
function class:ShouldDropWeapon(drop) end


---Opens the player steam profile page in the steam overlay browser.
function class:ShowProfile() end


---Signals the entity that it was dropped by the gravity gun.
---@param ent Entity
function class:SimulateGravGunDrop(ent) end


---Signals the entity that it was picked up by the gravity gun. This call is only required if you want to simulate the situation of picking up objects.
---@param ent Entity
---@param lightning boolean
function class:SimulateGravGunPickup(ent,lightning) end


---Starts spectate mode for given player. This will also affect the players movetype in some cases.
---@param mode number
function class:Spectate(mode) end


---Makes the player spectate the entity. To get the applied spectated entity, use Player:GetObserverTarget.
---@param entity Entity
function class:SpectateEntity(entity) end


---Makes a player spray their decal.
---@param sprayOrigin Vector
---@param sprayEndPos Vector
function class:SprayDecal(sprayOrigin,sprayEndPos) end


---Disables the sprint on the player.
function class:SprintDisable() end


---Enables the sprint on the player.
function class:SprintEnable() end


---We advise against using this. It may be changed or removed in a future update. This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect. Doesn't appear to do anything.
function class:StartSprinting() end


---We advise against using this. It may be changed or removed in a future update. This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect. When used in a GM:SetupMove hook, this function will force the player to walk, as well as preventing the player from sprinting.
function class:StartWalking() end


---Returns the player's SteamID. See Player:AccountID for a shorter version of the SteamID and Player:SteamID64 for the full SteamID. It is recommended to use Player:SteamID64 over the other SteamID formats whenever possible. In a -multirun environment, this will return STEAM_0:0:0 (serverside) or NULL (clientside) for all "copies" of a player because they are not authenticated with Steam. For Bots this will return BOT.
---@return string
function class:SteamID() end


---Returns the player's full 64-bit SteamID, also known as CommunityID. Information on how data is packed into this value can be found here. See Player:AccountID for a function that returns only the Account ID part of the SteamID and Player:SteamID for the text version of the SteamID. In a -multirun environment, this will return "0" for all "copies" of a player because they are not authenticated with Steam. For bots, this will return 90071996842377216 (equivalent to STEAM_0:0:0) for the first bot to join. For each additional bot, the number increases by 1. So the next bot will be 90071996842377217 (STEAM_0:1:0) then 90071996842377218 (STEAM_0:0:1) and so on.
---@return string
function class:SteamID64() end


---We advise against using this. It may be changed or removed in a future update. This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect. When used in a GM:SetupMove hook, this function will prevent the player from sprinting. When +walk is engaged, the player will still be able to sprint to half speed (normal run speed) as opposed to full sprint speed without this function.
function class:StopSprinting() end


---We advise against using this. It may be changed or removed in a future update. This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect. When used in a GM:SetupMove hook, this function behaves unexpectedly by preventing the player from sprinting similar to Player:StopSprinting.
function class:StopWalking() end


---Turns off the zoom mode of the player. (+zoom console command) Basically equivalent of entering "-zoom" into player's console.
function class:StopZooming() end


---We advise against using this. It may be changed or removed in a future update. Alias of Player:RemoveAllAmmo Removes all ammo from the player.
function class:StripAmmo() end


---Removes the specified weapon class from a certain player this function will call the Entity:OnRemove but if you try use Entity:GetOwner it will return nil
---@param weapon string
function class:StripWeapon(weapon) end


---Removes all weapons from a certain player
function class:StripWeapons() end


---Prevents a hint from showing up. This function is only available in Sandbox and its derivatives
---@param name string
function class:SuppressHint(name) end


---Attempts to switch the player weapon to the one specified in the "cl_defaultweapon" convar, if the player does not own the specified weapon nothing will happen. If you want to switch to a specific weapon, use: Player:SetActiveWeapon
function class:SwitchToDefaultWeapon() end


---Returns the player's team ID. Returns 0 clientside when the game is not fully loaded.
---@return number
function class:Team() end


---Returns the time in seconds since the player connected. Bots will always return value 0.
---@return number
function class:TimeConnected() end


---Performs a trace hull and applies damage to the entities hit, returns the first entity hit. Hitting the victim entity with this function in ENTITY:OnTakeDamage can cause infinite loops.
---@param startPos Vector
---@param endPos Vector
---@param mins Vector
---@param maxs Vector
---@param damage number
---@param damageFlags number
---@param damageForce number
---@param damageAllNPCs boolean
---@return Entity
function class:TraceHullAttack(startPos,endPos,mins,maxs,damage,damageFlags,damageForce,damageAllNPCs) end


---Translates ACT enum according to the holdtype of players currently held weapon.
---@param act number
---@return number
function class:TranslateWeaponActivity(act) end


---Unfreezes all objects the player has frozen with their Physics Gun. Same as double pressing R while holding Physics Gun.
function class:UnfreezePhysicsObjects() end


---We advise against using this. It may be changed or removed in a future update. This function has collisions, where more than one player can have the same UniqueID. It is highly recommended to use Player:SteamID64 or Player:SteamID instead, which are guaranteed to be unique to each player. Returns a 32 bit integer that remains constant for a player across joins/leaves and across different servers. This can be used when a string is inappropriate - e. g. in a database primary key. In Singleplayer, this function will always return 1.
---@return number
function class:UniqueID() end


---We advise against using this. It may be changed or removed in a future update. This is based on Player:UniqueID which is deprecated and vulnerable to collisions. Returns a table that will stay allocated for the specific player serveside between connects until the server shuts down. On client it has no such special behavior. This table is not synchronized (networked) between client and server.
---@param key any
---@return table
function class:UniqueIDTable(key) end


---Unlocks the player movement if locked previously. Will disable godmode for the player if locked previously.
function class:UnLock() end


---Stops the player from spectating another entity.
function class:UnSpectate() end


---Returns the player's ID. You can use Player() to get the player by their ID.
---@return number
function class:UserID() end


---Simulates a push on the client's screen. This adds view punch velocity, and does not touch the current view punch angle, for which you can use Player:SetViewPunchAngles.
---@param PunchAngle Angle
function class:ViewPunch(PunchAngle) end


---Resets the player's view punch (and the view punch velocity, read more at Player:ViewPunch) effect back to normal.
---@param tolerance number
function class:ViewPunchReset(tolerance) end


---Returns the players voice volume, how loud the player's voice communication currently is, as a normal number. Doesn't work on local player unless the voice_loopback convar is set to 1.---@return number
function class:VoiceVolume() end
