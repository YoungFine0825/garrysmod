---@class GM
local class = {}


---Called when a map I/O event occurs. See also Entity:Fire and Entity:Input for functions to fire Inputs on entities.
---@param ent Entity
---@param input string
---@param activator Entity
---@param caller Entity
---@param value any
---@return boolean
function class:AcceptInput(ent,input,activator,caller,value) end


---Adds a death notice entry.
---@param attacker string
---@param attackerTeam number
---@param inflictor string
---@param victim string
---@param victimTeam number
function class:AddDeathNotice(attacker,attackerTeam,inflictor,victim,victimTeam) end


---Allows you to adjust the mouse sensitivity.
---@param defaultSensitivity number
---@return number
function class:AdjustMouseSensitivity(defaultSensitivity) end


---Called when a player tries to pick up something using the "use" key, return to override. This hook will not be called if sv_playerpickupallowed is set to 0. See GM:GravGunPickupAllowed for the Gravity Gun pickup variant. See GM:PhysgunPickup for the Physics Gun pickup variant.
---@param ply Player
---@param ent Entity
---@return boolean
function class:AllowPlayerPickup(ply,ent) end


---This hook is used to calculate animations for a player. This hook must return the same values at the same time on both, client and server. On client for players to see the animations, on server for hit detection to work properly.
---@param ply Player
---@param vel Vector
---@return number, number
function class:CalcMainActivity(ply,vel) end


---Called from GM:CalcView when player is in driving a vehicle. This hook may not be called in gamemodes that override GM:CalcView.
---@param veh Vehicle
---@param ply Player
---@param view table
---@return table
function class:CalcVehicleView(veh,ply,view) end


---Allows override of the default view.
---@param ply Player
---@param origin Vector
---@param angles Angle
---@param fov number
---@param znear number
---@param zfar number
---@return table
function class:CalcView(ply,origin,angles,fov,znear,zfar) end


---Allows overriding the position and angle of the viewmodel.
---@param wep Weapon
---@param vm Entity
---@param oldPos Vector
---@param oldAng Angle
---@param pos Vector
---@param ang Angle
---@return Vector, Angle
function class:CalcViewModelView(wep,vm,oldPos,oldAng,pos,ang) end


---Called whenever a players tries to create an undo.
---@param ply Player
---@param undo table
---@return boolean
function class:CanCreateUndo(ply,undo) end


---Called when a variable is edited on an Entity (called by Edit Properties. . . menu), to determine if the edit should be permitted. See Editable entities for more details about the system.
---@param ent Entity
---@param ply Player
---@param key string
---@param val string
---@param editor table
---@return boolean
function class:CanEditVariable(ent,ply,key,val,editor) end


---Determines if the player can exit the vehicle on their own. Player:ExitVehicle will bypass this hook. See GM:CanPlayerEnterVehicle for the opposite hook. See also GM:PlayerLeaveVehicle for a hook that will be called whenever a player exits any vehicle for any reason.
---@param veh Vehicle
---@param ply Player
---@return boolean
function class:CanExitVehicle(veh,ply) end


---Determines whether or not a given player player can enter the given vehicle. Player:EnterVehicle will still call this hook. Called just before GM:PlayerEnteredVehicle. See also GM:CanExitVehicle.
---@param player Player
---@param vehicle Vehicle
---@param role number
---@return boolean
function class:CanPlayerEnterVehicle(player,vehicle,role) end


---Determines if the player can kill themselves using the concommands kill or explode.
---@param player Player
---@return boolean
function class:CanPlayerSuicide(player) end


---Determines if the player can unfreeze the entity.
---@param player Player
---@param entity Entity
---@param phys PhysObj
---@return boolean
function class:CanPlayerUnfreeze(player,entity,phys) end


---Controls if a property can be used or not.
---@param ply Player
---@param property string
---@param ent Entity
---@return boolean
function class:CanProperty(ply,property,ent) end


---Called whenever a players tries to undo.
---@param ply Player
---@param undo table
---@return boolean
function class:CanUndo(ply,undo) end


---Called each frame to record demos to video using IVideoWriter. This hook is called every frame regardless of whether or not a demo is being recorded
function class:CaptureVideo() end


---Called when a message is printed to the chat box. Note, that this isn't working with player messages even though there are arguments for it. For player messages see GM:PlayerSay and GM:OnPlayerChat
---@param index number
---@param name string
---@param text string
---@param type string
---@return boolean
function class:ChatText(index,name,text,type) end


---Called whenever the content of the user's chat input box is changed.
---@param text string
function class:ChatTextChanged(text) end


---Called when a non local player connects to allow the Lua system to check the password. The default behaviour in the base gamemodes emulates what would normally happen. If sv_password is set and its value matches the password passed in by the client - then they are allowed to join. If it isn't set it lets them in too.
---@param steamID64 string
---@param ipAddress string
---@param svPassword string
---@param clPassword string
---@param name string
---@return boolean, string
function class:CheckPassword(steamID64,ipAddress,svPassword,clPassword,name) end


---Called when a player's sign on state changes. You cannot get a valid player object from the userID at any point during this hook. Issue Tracker: 4899
---@param userID number
---@param oldState number
---@param newState number
function class:ClientSignOnStateChanged(userID,oldState,newState) end


---Called when derma menus are closed with CloseDermaMenus.
function class:CloseDermaMenus() end


---Called whenever an entity becomes a clientside ragdoll. See GM:CreateEntityRagdoll for serverside ragdolls.
---@param entity Entity
---@param ragdoll Entity
function class:CreateClientsideRagdoll(entity,ragdoll) end


---Called when a serverside ragdoll of an entity has been created. See GM:CreateClientsideRagdoll for clientside ragdolls.
---@param owner Entity
---@param ragdoll Entity
function class:CreateEntityRagdoll(owner,ragdoll) end


---Allows you to change the players movements before they're sent to the server. See Game Movement for an explanation on the move system. Due to this hook being clientside only, it could be overridden by the user allowing them to completely skip your logic, it is recommended to use GM:StartCommand in a shared file instead.
---@param cmd CUserCmd
---@return boolean
function class:CreateMove(cmd) end


---Teams are created within this hook using team. SetUp. This hook is called before GM:PreGamemodeLoaded.
function class:CreateTeams() end


---Called upon an animation event, this is the ideal place to call player animation functions such as Player:AddVCDSequenceToGestureSlot, Player:AnimRestartGesture and so on.
---@param ply Player
---@param event number
---@param data number
---@return number
function class:DoAnimationEvent(ply,event,data) end


---Handles the player's death. This hook is not called if the player is killed by Player:KillSilent. See GM:PlayerSilentDeath for that. GM:PlayerDeath is called after this hook GM:PostPlayerDeath is called after that Player:Alive will return false in this hook.
---@param ply Player
---@param attacker Entity
---@param dmg CTakeDamageInfo
function class:DoPlayerDeath(ply,attacker,dmg) end


---This hook is called every frame to draw all of the current death notices.
---@param x number
---@param y number
function class:DrawDeathNotice(x,y) end


---Called every frame before drawing the in-game monitors ( Breencast, in-game TVs, etc ), but doesn't seem to be doing anything, trying to render 2D or 3D elements fail.
function class:DrawMonitors() end


---Called after all other 2D draw hooks are called. Draws over all VGUI Panels and HUDs. Unlike GM:HUDPaint, this hook is called with the game paused and while the Camera SWEP is equipped. Only gets called when r_drawvgui is enabled. This is a rendering hook which provides a 2d rendering context.
function class:DrawOverlay() end


---Allows you to override physgun effects rendering. This is still called when physgun_drawbeams is set to 0, because this hook is also capable of overriding physgun sprite effects, while the convar does not.
---@param ply Player
---@param physgun Weapon
---@param enabled boolean
---@param target Entity
---@param physBone number
---@param hitPos Vector
---@return boolean
function class:DrawPhysgunBeam(ply,physgun,enabled,target,physBone,hitPos) end


---Called right before an entity stops driving. Overriding this hook will cause it to not call drive. End and the player will not stop driving.
---@param ent Entity
---@param ply Player
function class:EndEntityDriving(ent,ply) end


---Called whenever a sound has been played. This will not be called clientside if the server played the sound without the client also calling Entity:EmitSound.
---@param data table
---@return boolean
function class:EntityEmitSound(data) end


---Called every time a bullet is fired from an entity. This hook is called directly from Entity:FireBullets. Due to this, you cannot call Entity:FireBullets inside this hook or an infinite loop will occur crashing the game.
---@param entity Entity
---@param data table
---@return boolean
function class:EntityFireBullets(entity,data) end


---Called when a key-value pair is set on an entity on map spawn. Is not called by Entity:SetKeyValue. See ENTITY:KeyValue for a scripted entities hook, and its scripted weapon alternative: WEAPON:KeyValue.
---@param ent Entity
---@param key string
---@param value string
---@return string
function class:EntityKeyValue(ent,key,value) end


---Called when an NW2Var is changed. If a NW2Var is set on an entity that is based on a Lua Entity could result in the NW2Var being mixed up with other ones and being updated multiple times. Issue Tracker: 5455This hook is fired before the client value is actually changed. Calling the GetNW2 function for the specified variable name within this hook will return the old value, not the current/updated one. This hook gets called for all NW2Vars on all Entities in a full update. The old value will be nil in this case. If this hook seems to be called for no apparent reason, check if it's caused by a full update.
---@param ent Entity
---@param name string
---@param oldval any
---@param newval any
function class:EntityNetworkedVarChanged(ent,name,oldval,newval) end


---Called right before removal of an entity. This hook is called clientside during full updates due to how networking works in the Source Engine. This can happen when the client briefly loses connection to the server, and can be simulated via cl_fullupdate for testing purposes.
---@param ent Entity
---@param fullUpdate boolean
function class:EntityRemoved(ent,fullUpdate) end


---Called when an entity takes damage. You can modify all parts of the damage info in this hook. Applying damage from this hook to the entity taking damage will lead to infinite loop/crash.
---@param target Entity
---@param dmg CTakeDamageInfo
---@return boolean
function class:EntityTakeDamage(target,dmg) end


---This hook polls the entity the player use action should be applied to. The default behavior of this hook is in CBasePlayer::FindUseEntity. Despite CBasePlayer::FindUseEntity being defined shared, it is only called serverside in practice, so this hook will be only called serverside, as well. It is possible for modules to call it clientside, so the Lua code should still be treated as shared.
---@param ply Player
---@param defaultEnt Entity
---@return Entity
function class:FindUseEntity(ply,defaultEnt) end


---Runs when user cancels/finishes typing.
function class:FinishChat() end


---Called after GM:Move, applies all the changes from the CMoveData to the player. See Game Movement for an explanation on the move system.
---@param ply Player
---@param mv CMoveData
---@return boolean
function class:FinishMove(ply,mv) end


---Called to allow override of the default Derma skin for all panels. This hook is only called on Lua start up, changing its value (or adding new hooks) after it has been already called will not have any effect.
---@return string
function class:ForceDermaSkin() end


---Called when game content has been changed, for example an addon or a mountable game was (un)mounted.
function class:GameContentChanged() end


---An internal function used to get an untranslated string to show in the kill feed as the entity's name. See GM:SendDeathNotice
---@param ent Entity
---@return string
function class:GetDeathNoticeEntityName(ent) end


---Called when a player takes damage from falling, allows to override the damage.
---@param ply Player
---@param speed number
---@return number
function class:GetFallDamage(ply,speed) end


---Called when the game(server) needs to update the text shown in the server browser as the gamemode. This hook (and the sv_gamename_override command) may not work on some popular gamemodes like DarkRP or Trouble Terrorist Town. This is not a bug, it's just how it works. See here for more information. Also, it only works on dedicated servers and is called at regular intervals (about one second) even if the server has no players and the hibernation function is enabled.
---@return string
function class:GetGameDescription() end


---Allows you to modify the Source Engine's motion blur shaders.
---@param horizontal number
---@param vertical number
---@param forward number
---@param rotational number
---@return number, number, number, number
function class:GetMotionBlurValues(horizontal,vertical,forward,rotational) end


---Called to determine preferred carry angles for the entity. It works for both, +use pickup and gravity gun pickup. Due to nature of the gravity gun coding in multiplayer, this hook MAY seem to not work ( but rest assured it does ), due to clientside prediction not knowing the carry angles. The +use pickup doesn't present this issue as it doesn't predict the player carrying the object clientside ( as you may notice by the prop lagging behind in multiplayer )This hook can not override preferred carry angles of props such as the sawblade and the harpoon.
---@param ent Entity
---@param ply Player
---@return Angle
function class:GetPreferredCarryAngles(ent,ply) end


---Returns the color for the given entity's team. This is used in chat and deathnotice text.
---@param ent Entity
---@return table
function class:GetTeamColor(ent) end


---Returns the team color for the given team index.
---@param team number
---@return table
function class:GetTeamNumColor(team) end


---Override this hook to disable/change ear-grabbing in your gamemode.
---@param ply Player
function class:GrabEarAnimation(ply) end


---Called when an entity is released by a gravity gun. See GM:PhysgunDrop for the Physics Gun drop variant.
---@param ply Player
---@param ent Entity
function class:GravGunOnDropped(ply,ent) end


---Called when an entity is picked up by a gravity gun. See GM:OnPlayerPhysicsPickup for the player +use pickup variant. See GM:OnPhysgunPickup for the Physics Gun pickup variant.
---@param ply Player
---@param ent Entity
function class:GravGunOnPickedUp(ply,ent) end


---Called every tick to poll whether a player is allowed to pick up an entity with the gravity gun or not. See GM:AllowPlayerPickup for the +USE pickup variant. See GM:PhysgunPickup for the Physics Gun pickup variant. Calls ENTITY:GravGunPickupAllowed on the entity being hovered every frame in Sandbox-derived gamemodes.
---@param ply Player
---@param ent Entity
---@return boolean
function class:GravGunPickupAllowed(ply,ent) end


---Called when an entity is about to be punted with the gravity gun (primary fire). By default this function makes ENTITY:GravGunPunt work in Sandbox derived gamemodes.
---@param ply Player
---@param ent Entity
---@return boolean
function class:GravGunPunt(ply,ent) end


---Called when the mouse has been double clicked on any panel derived from CGModBase, such as the panel used by gui. EnableScreenClicker and the panel used by Panel:ParentToHUD. By default this hook calls GM:GUIMousePressed.
---@param mouseCode number
---@param aimVector Vector
function class:GUIMouseDoublePressed(mouseCode,aimVector) end


---Called whenever a players presses a mouse key on the context menu in Sandbox or on any panel derived from CGModBase, such as the panel used by gui. EnableScreenClicker and the panel used by Panel:ParentToHUD. See GM:VGUIMousePressed for a hook that is called on all VGUI elements.
---@param mouseCode number
---@param aimVector Vector
function class:GUIMousePressed(mouseCode,aimVector) end


---Called whenever a players releases a mouse key on the context menu in Sandbox or on any panel derived from CGModBase, such as the panel used by gui. EnableScreenClicker and the panel used by Panel:ParentToHUD.
---@param mouseCode number
---@param aimVector Vector
function class:GUIMouseReleased(mouseCode,aimVector) end


---Called to handle player armor reduction, when player receives damage. Clarify hook order with other damage hooks.
---@param ply Player
---@param dmginfo CTakeDamageInfo
function class:HandlePlayerArmorReduction(ply,dmginfo) end


---Allows to override player driving animations.
---@param ply Player
---@return boolean
function class:HandlePlayerDriving(ply) end


---Allows to override player crouch animations.
---@param ply Player
---@param velocity number
---@return boolean
function class:HandlePlayerDucking(ply,velocity) end


---Called every frame by the player model animation system. Allows to override player jumping animations.
---@param ply Player
---@param velocity number
---@return boolean
function class:HandlePlayerJumping(ply,velocity) end


---Called every frame by the player model animation system. Allows to override player landing animations.
---@param ply Player
---@param velocity number
---@param onGround boolean
---@return boolean
function class:HandlePlayerLanding(ply,velocity,onGround) end


---Allows to override player noclip animations.
---@param ply Player
---@param velocity number
---@return boolean
function class:HandlePlayerNoClipping(ply,velocity) end


---Allows to override player swimming animations.
---@param ply Player
---@param velocity number
---@return boolean
function class:HandlePlayerSwimming(ply,velocity) end


---Allows to override player flying ( in mid-air, not noclipping ) animations.
---@param ply Player
---@param velocity number
---@return boolean
function class:HandlePlayerVaulting(ply,velocity) end


---Hides the team selection panel.
function class:HideTeam() end


---Called when the client has picked up ammo. Override to disable default HUD notification.
---@param itemName string
---@param amount number
function class:HUDAmmoPickedUp(itemName,amount) end


---Renders the HUD pick-up history. Override to hide default or draw your own HUD.
function class:HUDDrawPickupHistory() end


---Called every frame to render the scoreboard. It is recommended to use Derma and VGUI for this job instead of this hook. Called right after GM:HUDPaint. This is a rendering hook which provides a 2d rendering context.
function class:HUDDrawScoreBoard() end


---Called from GM:HUDPaint to draw player info when you hover over a player with your crosshair or mouse.
---@return boolean
function class:HUDDrawTargetID() end


---Called when an item has been picked up. Override to disable the default HUD notification.
---@param itemName string
function class:HUDItemPickedUp(itemName) end


---Called whenever the HUD should be drawn. This is the ideal place to draw custom HUD elements. To prevent the default game HUD from drawing, use GM:HUDShouldDraw. This hook does not get called when the Camera SWEP is held, or when the esc menu is open. If you need to draw in those situations, use GM:DrawOverlay instead. This is a rendering hook which provides a 2d rendering context.
function class:HUDPaint() end


---Called before GM:HUDPaint when the HUD background is being drawn. Just like GM:HUDPaint, this hook will not be called when the main menu is visible. GM:PostDrawHUD does not have this behavior. Things rendered in this hook will always appear behind things rendered in GM:HUDPaint. This is a rendering hook which provides a 2d rendering context.
function class:HUDPaintBackground() end


---Called when the Gamemode is about to draw a given element on the client's HUD (heads-up display). This hook is called HUNDREDS of times per second (more than 5 times per frame on average). You shouldn't be performing any computationally intensive operations.
---@param name string
---@return boolean
function class:HUDShouldDraw(name) end


---Called when a weapon has been picked up. Override to disable the default HUD notification.
---@param weapon Weapon
function class:HUDWeaponPickedUp(weapon) end


---Called after the gamemode loads and starts. No entities would be present at the time this hook is called, please see GM:InitPostEntity for a one time fire hook after all map entities have been initialized.
function class:Initialize() end


---Called after all the entities are initialized. Starting from this hook LocalPlayer will return valid object. At this point the client only knows about the entities that are within the spawnpoints' PVS (Potential Visibility Set). For instance, if the server sends an entity that is not within this PVS, the client will receive it as NULL entity.
function class:InitPostEntity() end


---Allows you to modify the supplied User Command with mouse input. This could be used to make moving the mouse do funky things to view angles.
---@param cmd CUserCmd
---@param x number
---@param y number
---@param ang Angle
---@return boolean
function class:InputMouseApply(cmd,x,y,ang) end


---Check if a player can spawn at a certain spawnpoint.
---@param ply Player
---@param spawnpoint Entity
---@param makeSuitable boolean
---@return boolean
function class:IsSpawnpointSuitable(ply,spawnpoint,makeSuitable) end


---Called whenever a player pressed a key included within the IN keys. For a more general purpose function that handles all kinds of input, see GM:PlayerButtonDown. Despite being a predicted hook, it will still be called in singleplayer for your convenience. Due to this being a predicted hook, ParticleEffects created only serverside from this hook will not be networked to the client, so make sure to do that on both realms.
---@param ply Player
---@param key number
function class:KeyPress(ply,key) end


---Runs when a IN key was released by a player. For a more general purpose function that handles all kinds of input, see GM:PlayerButtonUp. Despite being a predicted hook, it will still be called in singleplayer for your convenience.
---@param ply Player
---@param key number
function class:KeyRelease(ply,key) end


---This is used internally - although you're able to use it you probably shouldn't. Called from gm_load when the game should load a map.
---@param data string
---@param map string
---@param timestamp number
function class:LoadGModSave(data,map,timestamp) end


---Called while an addon from the Steam workshop is downloading. Used by default to update details on the fancy workshop download panel.
---@return string, string
function class:LoadGModSaveFailed() end


---Called when menu. lua has finished loading.
function class:MenuStart() end


---Override this gamemode function to disable mouth movement when talking on voice chat.
---@param ply Player
function class:MouthMoveAnimation(ply) end


---The Move hook is called for you to manipulate the player's MoveData. You shouldn't adjust the player's position in any way in the move hook. This is because due to prediction errors, the netcode might run the move hook multiple times as packets arrive late. Therefore you should only adjust the movedata construct in this hook. Generally you shouldn't have to use this hook - if you want to make a custom move type you should look at the drive system. This hook is called after GM:PlayerTick. See Game Movement for an explanation on the move system.
---@param ply Player
---@param mv CMoveData
---@return boolean
function class:Move(ply,mv) end


---Returning true in this hook will cause it to render depth buffers defined with render. GetResolvedFullFrameDepth.
---@return boolean
function class:NeedsDepthPass() end


---Called when an entity has been created over the network.
---@param ent Entity
function class:NetworkEntityCreated(ent) end


---Called when a player's SteamID has been validated by Steam. See also GM:PlayerAuthed. This hook doesn't work intentionally in singleplayer because the SteamID is not validated in that case. This also applies to sv_lan 1 servers for every duplicate -multirun client.
---@param name string
---@param steamID string
---@param ownerID string
function class:NetworkIDValidated(name,steamID,ownerID) end


---Called whenever this entity changes its transmission state for this LocalPlayer, such as exiting or re entering the PVS (Potential Visibility Set). This is the best place to handle the reset of Entity:SetPredictable, as this would be usually called when the player lags and requests a full packet update. When the entity stops transmitting, Entity:IsDormant will only return true after this hook.
---@param entity Entity
---@param shouldtransmit boolean
function class:NotifyShouldTransmit(entity,shouldtransmit) end


---Called when a player has achieved an achievement. You can get the name and other information from an achievement ID with the achievements library.
---@param ply Player
---@param achievement number
function class:OnAchievementAchieved(ply,achievement) end


---Called when the local player presses TAB while having their chatbox opened.
---@param text string
---@return string
function class:OnChatTab(text) end


---Called when the player cleans up something.
---@param name string
---@return boolean
function class:OnCleanup(name) end


---Called when a caption has been emitted to the closed caption box.
---@param soundScript string
---@param duration number
---@param fromPlayer boolean
---@param fullText string
---@return boolean
function class:OnCloseCaptionEmit(soundScript,duration,fromPlayer,fullText) end


---Called when the context menu keybind (+menu_context) is released, which by default is C. This hook will not run if input. IsKeyTrapping returns true. See also GM:OnContextMenuOpen.
function class:OnContextMenuClose() end


---Called when the context menu keybind (+menu_context) is pressed, which by default is c. See also GM:OnContextMenuClose.
function class:OnContextMenuOpen() end


---Called when the crazy physics detection detects an entity with Crazy Physics.
---@param ent Entity
---@param physobj PhysObj
function class:OnCrazyPhysics(ent,physobj) end


---Called when a player has been hurt by an explosion. Override to disable default sound effect.
---@param ply Player
---@param dmginfo CTakeDamageInfo
function class:OnDamagedByExplosion(ply,dmginfo) end


---Called as soon as the entity is created. Very little of the entity's properties will be initialized at this stage. (keyvalues, classname, flags, anything), especially on the serverside. Some entities on initial map spawn are passed through this hook, and then removed in the same frame. This is used by the engine to precache things like models and sounds, so always check their validity with IsValid. Removing the created entity during this event can lead to unexpected problems. Use timer. Simple( 0, . . . . ) to safely remove the entity.
---@param entity Entity
function class:OnEntityCreated(entity) end


---Called when the Entity:WaterLevel of an entity is changed. 0 - The entity isn't in water. 1 - Slightly submerged (at least to the feet). 2 - The majority of the entity is submerged (at least to the waist). 3 - Completely submerged. This hook can be considered a physics callback, so changing collision rules (Entity:SetSolidFlags) in it may lead to a crash!
---@param entity Entity
---@param old number
---@param new number
function class:OnEntityWaterLevelChanged(entity,old,new) end


---Called when the gamemode is loaded. LocalPlayer() returns NULL at the time this is run.
function class:OnGamemodeLoaded() end


---Called when a Lua error occurs. Doesn't run for ErrorNoHalt or Error. On the server realm, this hook will only account for server-side errors, not client-side ones.
---@param error string
---@param realm string
---@param stack table
---@param name string
---@param id number
function class:OnLuaError(error,realm,stack,name,id) end


---Called when a Addon Conflict occurs, only works in the Menu realm.
---@param addon1 string
---@param addon2 string
---@param fileName string
function class:OnNotifyAddonConflict(addon1,addon2,fileName) end


---Called whenever an NPC is killed.
---@param npc NPC
---@param attacker Entity
---@param inflictor Entity
function class:OnNPCKilled(npc,attacker,inflictor) end


---Called when the main menu has been blocked by GM:OnPauseMenuShow four times in a small interval. This is used internally to explain to the user that they can hold ⇧ shift to force open the main menu.
function class:OnPauseMenuBlockedTooManyTimes() end


---Called when the pause menu is attempting to be opened. Allows you to prevent the main menu from being opened that time. The user can hold ⇧ shift to not call this hook. If the main menu is blocked multiple times in short succession, a warning will be displayed to the end user on how to bypass the hook.
---@return boolean
function class:OnPauseMenuShow() end


---Called when a permission gets Granted or Revoked.
function class:OnPermissionsChanged() end


---Called when a player freezes an entity with the physgun. This is not called for players or NPCs being held with the physgun. Issue Tracker: 723
---@param weapon Entity
---@param physobj PhysObj
---@param ent Entity
---@param ply Player
function class:OnPhysgunFreeze(weapon,physobj,ent,ply) end


---Called to when a player has successfully picked up an entity with their Physics Gun. Not to be confused with GM:PhysgunPickup which is called multiple times to ask if the player should be able to pick up an entity. See GM:GravGunOnPickedUp for the Gravity Gun pickup variant. See GM:OnPlayerPhysicsPickup for the player +use pickup variant.
---@param ply Player
---@param ent Entity
function class:OnPhysgunPickup(ply,ent) end


---Called when a player reloads with the physgun. Override this to disable default unfreezing behavior.
---@param physgun Weapon
---@param ply Player
---@return boolean
function class:OnPhysgunReload(physgun,ply) end


---We advise against using this. It may be changed or removed in a future update. Use GM:PlayerChangedTeam instead, which works for every Player:SetTeam call. Called when a player has changed team using GM:PlayerJoinTeam. This hook will not work with hook. Add and it is only called manually from GM:PlayerJoinTeam by the base gamemode
---@param ply Player
---@param oldTeam number
---@param newTeam number
function class:OnPlayerChangedTeam(ply,oldTeam,newTeam) end


---Called whenever a player sends a chat message. For the serverside equivalent, see GM:PlayerSay. The text input of this hook depends on GM:PlayerSay. If it is suppressed on the server, it will be suppressed on the client. This also means, that a message surpressed with this hook will be still visible to other clients.
---@param ply Player
---@param text string
---@param teamChat boolean
---@param isDead boolean
---@return boolean
function class:OnPlayerChat(ply,text,teamChat,isDead) end


---Called when a player makes contact with the ground after a jump or a fall.
---@param player Entity
---@param inWater boolean
---@param onFloater boolean
---@param speed number
---@return boolean
function class:OnPlayerHitGround(player,inWater,onFloater,speed) end


---Called when a player jumps.
---@param player Entity
---@param speed number
function class:OnPlayerJump(player,speed) end


---Called when a player +use drops an entity.
---@param ply Player
---@param ent Entity
---@param thrown boolean
function class:OnPlayerPhysicsDrop(ply,ent,thrown) end


---Called when a player +use pickups up an entity. This will be called after the entity passes though GM:AllowPlayerPickup. See GM:GravGunOnPickedUp for the Gravity Gun pickup variant. See GM:OnPhysgunPickup for the Physics Gun pickup variant.
---@param ply Player
---@param ent Entity
function class:OnPlayerPhysicsPickup(ply,ent) end


---Called when gamemode has been reloaded by auto refresh. It seems that this event can be triggered more than once for a single refresh event.
function class:OnReloaded() end


---Called when the player's screen resolution of the game changes. ScrW and ScrH will return the new values when this hook is called.
---@param oldWidth number
---@param oldHeight number
---@param newWidth number
---@param newHeight number
function class:OnScreenSizeChanged(oldWidth,oldHeight,newWidth,newHeight) end


---Called when a player releases the +menu bind on their keyboard, which is bound to Q by default.
function class:OnSpawnMenuClose() end


---Called when a player presses the +menu bind on their keyboard, which is bound to q by default.
function class:OnSpawnMenuOpen() end


---Called when a DTextEntry gets focus. This hook is run from DTextEntry:OnGetFocus and PANEL:OnMousePressed of DTextEntry.
---@param panel Panel
function class:OnTextEntryGetFocus(panel) end


---Called when a DTextEntry loses focus.
---@param panel Panel
function class:OnTextEntryLoseFocus(panel) end


---Called when the player undoes something.
---@param name string
---@param customText string
---@return boolean
function class:OnUndo(name,customText) end


---Called when the player changes their weapon to another one - and their viewmodel model changes. This is not always called clientside. Issue Tracker: 2473
---@param viewmodel Entity
---@param oldModel string
---@param newModel string
function class:OnViewModelChanged(viewmodel,oldModel,newModel) end


---Called when a player drops an entity with the Physgun. See GM:GravGunOnDropped for the Gravity Gun drop variant.
---@param ply Player
---@param ent Entity
function class:PhysgunDrop(ply,ent) end


---Called to determine if a player should be able to pick up an entity with the Physics Gun. See GM:OnPhysgunPickup for a hook which is called when a player has successfully picked up an entity. See GM:GravGunPickupAllowed for the Gravity Gun pickup variant. See GM:AllowPlayerPickup for the +USE pickup variant.
---@param player Player
---@param entity Entity
---@return boolean
function class:PhysgunPickup(player,entity) end


---Called after player's reserve ammo count changes.
---@param ply Player
---@param ammoID number
---@param oldCount number
---@param newCount number
function class:PlayerAmmoChanged(ply,ammoID,oldCount,newCount) end


---Called after the player is authenticated by Steam. This hook will also be called in singleplayer. See also GM:NetworkIDValidated CurTime returns 0 in this hook. Issue Tracker: 3026
---@param ply Player
---@param steamid string
---@param uniqueid string
function class:PlayerAuthed(ply,steamid,uniqueid) end


---Runs when a bind has been pressed. Allows to block commands. By using the "alias" console command, this hook can be effectively circumvented. To prevent this use input. TranslateAlias. To stop the user from using +attack, +left and any other movement commands of the sort, please look into using GM:StartCommand instead. The third argument will always be true. Issue Tracker: 1176This does not run for function keys binds (F1-F12). Issue Tracker: 2888
---@param ply Player
---@param bind string
---@param pressed boolean
---@param code number
---@return boolean
function class:PlayerBindPress(ply,bind,pressed,code) end


---Called when a player presses a button. This will not be called if player has a panel opened with keyboard input enabled, use PANEL:OnKeyCodePressed instead.
---@param ply Player
---@param button number
function class:PlayerButtonDown(ply,button) end


---Called when a player releases a button. This will not be called if player has a panel opened with keyboard input enabled, use PANEL:OnKeyCodeReleased instead.
---@param ply Player
---@param button number
function class:PlayerButtonUp(ply,button) end


---Decides whether a player can hear another player using voice chat. This hook is called several times a tick, so ensure your code is efficient.
---@param listener Player
---@param talker Player
---@return boolean, boolean
function class:PlayerCanHearPlayersVoice(listener,talker) end


---Returns whether or not a player is allowed to join a team
---@param ply Player
---@param team number
---@return boolean
function class:PlayerCanJoinTeam(ply,team) end


---Returns whether or not a player is allowed to pick an item up. (ammo, health, armor)
---@param ply Player
---@param item Entity
---@return boolean
function class:PlayerCanPickupItem(ply,item) end


---Returns whether or not a player is allowed to pick up a weapon.
---@param ply Player
---@param weapon Weapon
---@return boolean
function class:PlayerCanPickupWeapon(ply,weapon) end


---Returns whether or not the player can see the other player's chat. The speaker parameter does not have to be a valid Player object which happens when console messages are displayed for example.
---@param text string
---@param teamOnly boolean
---@param listener Player
---@param speaker Player
---@return boolean
function class:PlayerCanSeePlayersChat(text,teamOnly,listener,speaker) end


---Called when a player has changed team using Player:SetTeam. Avoid calling Player:SetTeam in this hook as it may cause an infinite loop!Player:Team inside this hook will return oldTeam.
---@param ply Player
---@param oldTeam number
---@param newTeam number
function class:PlayerChangedTeam(ply,oldTeam,newTeam) end


---Called whenever a player is about to spawn something to see if they hit a limit for whatever they are spawning. This hook will not be called in singleplayer, as singleplayer does not have limits.
---@param ply Player
---@param limitName string
---@param current number
---@param defaultMax number
---@return boolean
function class:PlayerCheckLimit(ply,limitName,current,defaultMax) end


---This is used internally - although you're able to use it you probably shouldn't. Called whenever a player's class is changed on the server-side with player_manager. SetPlayerClass.
---@param ply Player
---@param newID number
function class:PlayerClassChanged(ply,newID) end


---Executes when a player connects to the server. Called before the player has been assigned a UserID and entity. See the player_connect gameevent for a version of this hook called after the player entity has been created. This is only called clientside for listen server hosts. This is not called clientside for the local player.
---@param name string
---@param ip string
function class:PlayerConnect(name,ip) end


---Called when a player is killed by Player:Kill or any other normal means. This hook is not called if the player is killed by Player:KillSilent. See GM:PlayerSilentDeath for that. GM:DoPlayerDeath is called before this hook. GM:PostPlayerDeath is called after this hook. See Player:LastHitGroup if you need to get the last hit hitgroup of the player. Player:Alive will return false in this hook.
---@param victim Player
---@param inflictor Entity
---@param attacker Entity
function class:PlayerDeath(victim,inflictor,attacker) end


---Returns whether or not the default death sound should be muted.
---@param ply Player
---@return boolean
function class:PlayerDeathSound(ply) end


---Called every think while the player is dead. The return value will determine if the player respawns. Overwriting this function will prevent players from respawning by pressing space or clicking. This hook is not called for players with the FL_FROZEN flag applied. Issue Tracker: 1577
---@param ply Player
---@return boolean
function class:PlayerDeathThink(ply) end


---Called when a player leaves the server. See the player_disconnect gameevent for a shared version of this hook. Player:SteamID, Player:SteamID64, and the like can return nil here. This is not called in single-player or listen servers for the host. Issue Tracker: 3523
---@param ply Player
function class:PlayerDisconnected(ply) end


---Called to update the player's animation during a drive.
---@param ply Player
function class:PlayerDriveAnimate(ply) end


---Called when a weapon is dropped by a player via Player:DropWeapon. Also called when a weapon is removed from a player via Player:StripWeapon. See also GM:WeaponEquip for a hook when a player picks up a weapon. The weapon's Entity:GetOwner will be NULL at the time this hook is called. WEAPON:OnDrop will be called before this hook is.
---@param owner Player
---@param wep Weapon
function class:PlayerDroppedWeapon(owner,wep) end


---Called when player stops using voice chat.
---@param ply Player
function class:PlayerEndVoice(ply) end


---Called when a player enters a vehicle. Called just after GM:CanPlayerEnterVehicle. See also GM:PlayerLeaveVehicle.
---@param ply Player
---@param veh Vehicle
---@param role number
function class:PlayerEnteredVehicle(ply,veh,role) end


---Called before firing clientside animation events on a player model. See GM:PlayerHandleAnimEvent for the serverside version.
---@param ply Player
---@param pos Vector
---@param ang Angle
---@param event number
---@param name string
---@return boolean
function class:PlayerFireAnimationEvent(ply,pos,ang,event,name) end


---Called whenever a player steps. Return true to mute the normal sound. This hook is called on all clients.
---@param ply Player
---@param pos Vector
---@param foot number
---@param sound string
---@param volume number
---@param filter CRecipientFilter
---@return boolean
function class:PlayerFootstep(ply,pos,foot,sound,volume,filter) end


---Called when a player freezes an object.
---@param ply Player
---@param ent Entity
---@param physobj PhysObj
function class:PlayerFrozeObject(ply,ent,physobj) end


---Called before firing serverside animation events on the player models. See GM:PlayerFireAnimationEvent for the clientside version.
---@param ply Player
---@param event number
---@param eventTime number
---@param cycle number
---@param type number
---@param options string
function class:PlayerHandleAnimEvent(ply,event,eventTime,cycle,type,options) end


---Called when a player gets hurt.
---@param victim Player
---@param attacker Entity
---@param healthRemaining number
---@param damageTaken number
function class:PlayerHurt(victim,attacker,healthRemaining,damageTaken) end


---Called when the player spawns for the first time. See GM:PlayerSpawn for a hook called every player spawn. This hook is called before the player has fully loaded, when the player is still in seeing the Starting Lua screen. For example, trying to use the Entity:GetModel function will return the default model (models/player. mdl). You can send net messages starting from the player_activate game event. Due to the above note, sending net messages to the spawned player in this hook are highly unreliable, and they most likely won't be received (more information here: https://github. com/Facepunch/garrysmod-requests/issues/718). Workaround without networking: local load_queue = {} hook. Add( "PlayerInitialSpawn", "myAddonName/Load", function( ply ) load_queue[ ply ] = true end ) hook. Add( "StartCommand", "myAddonName/Load", function( ply, cmd ) if load_queue[ ply ] and not cmd:IsForced() then load_queue[ ply ] = nil -- Send what you need here! end end ) With networking: -- CLIENT hook. Add( "InitPostEntity", "Ready", function() net. Start( "cool_addon_client_ready" ) net. SendToServer() end )-- SERVER util. AddNetworkString( "cool_addon_client_ready" ) net. Receive( "cool_addon_client_ready", function( len, ply ) -- Send what you need here! end )
---@param player Player
---@param transition boolean
function class:PlayerInitialSpawn(player,transition) end


---Makes the player join a specified team. This is a convenience function that calls Player:SetTeam and runs the GM:OnPlayerChangedTeam hook.
---@param ply Player
---@param team number
function class:PlayerJoinTeam(ply,team) end


---Called when a player leaves a vehicle for any reason, including Player:ExitVehicle. See GM:PlayerEnteredVehicle for the opposite hook. For vehicles with exit animations, this will be called at the end of the animation, not at the start!
---@param ply Player
---@param veh Vehicle
function class:PlayerLeaveVehicle(ply,veh) end


---Called to give players the default set of weapons. This function may not work in your custom gamemode if you have overridden your GM:PlayerSpawn and you do not use self. BaseClass. PlayerSpawn or hook. Call.
---@param ply Player
function class:PlayerLoadout(ply) end


---Called when a player tries to switch noclip mode.
---@param ply Player
---@param desiredState boolean
---@return boolean
function class:PlayerNoClip(ply,desiredState) end


---Called after the player's think, just after GM:FinishMove. On the client side, it is only called for the local player.
---@param ply Player
function class:PlayerPostThink(ply) end


---Request a player to join the team. This function will check if the team is available to join or not. This hook is called when the player runs "changeteam" in the console. To prevent the player from changing teams, see GM:PlayerCanJoinTeam
---@param ply Player
---@param team number
function class:PlayerRequestTeam(ply,team) end


---Called when a player dispatched a chat message. For the clientside equivalent, see GM:OnPlayerChat. It may be more reliable to use gameevent/player_say to read messages serverside because addons commonly return values in this hook to change chat messages.
---@param sender Player
---@param text string
---@param teamChat boolean
---@return string
function class:PlayerSay(sender,text,teamChat) end


---Called to determine a spawn point for a player to spawn at. The spawn point entity will also impact the player's eye angle. For example, if the entity is upside down, the player's view will be as well.
---@param ply Player
---@param transition boolean
---@return Entity
function class:PlayerSelectSpawn(ply,transition) end


---Find a team spawn point entity for this player.
---@param team number
---@param ply Player
---@return Entity
function class:PlayerSelectTeamSpawn(team,ply) end


---Called whenever view model hands needs setting a model. By default this calls PLAYER:GetHandsModel and if that fails, sets the hands model according to his player model.
---@param ply Player
---@param ent Entity
function class:PlayerSetHandsModel(ply,ent) end


---Called whenever a player spawns and must choose a model. A good place to assign a model to a player. This function may not work in your custom gamemode if you have overridden your GM:PlayerSpawn and you do not use self. BaseClass. PlayerSpawn or hook. Call.
---@param ply Player
function class:PlayerSetModel(ply) end


---Returns true if the player should take damage from the given attacker. Applying damage from this hook to the player taking damage will lead to infinite loop/crash.
---@param ply Player
---@param attacker Entity
---@return boolean
function class:PlayerShouldTakeDamage(ply,attacker) end


---Allows to suppress player taunts.
---@param ply Player
---@param act number
---@return boolean
function class:PlayerShouldTaunt(ply,act) end


---Called when the player is killed by Player:KillSilent. The player is already considered dead when this hook is called. See GM:PlayerDeath for a hook which handles all other death causes. GM:PostPlayerDeath is called after this hook. Player:Alive will return true in this hook.
---@param ply Player
function class:PlayerSilentDeath(ply) end


---Called whenever a player spawns, including respawns. See GM:PlayerInitialSpawn for a hook called only the first time a player spawns. See the player_spawn gameevent for a shared version of this hook. By default, in "base" derived gamemodes, this hook will also call GM:PlayerLoadout and GM:PlayerSetModel, which may override your Entity:SetModel and Player:Give calls. Consider using the other hooks or a 0-second timer.
---@param player Player
---@param transition boolean
function class:PlayerSpawn(player,transition) end


---Called to spawn the player as a spectator.
---@param ply Player
function class:PlayerSpawnAsSpectator(ply) end


---Determines if the player can spray using the impulse 201 console command.
---@param sprayer Player
---@return boolean
function class:PlayerSpray(sprayer) end


---Called when player starts taunting.
---@param ply Player
---@param act number
---@param length number
function class:PlayerStartTaunt(ply,act,length) end


---Called when a player starts using voice chat. Set mp_show_voice_icons to 0, if you want disable icons above player.
---@param ply Player
---@return boolean
function class:PlayerStartVoice(ply) end


---Allows you to override the time between footsteps. This hook is called on all clients.
---@param ply Player
---@param type number
---@param walking boolean
---@return number
function class:PlayerStepSoundTime(ply,type,walking) end


---Called whenever a player attempts to either turn on or off their flashlight, returning false will deny the change. Also gets called when using Player:Flashlight.
---@param ply Player
---@param enabled boolean
---@return boolean
function class:PlayerSwitchFlashlight(ply,enabled) end


---Called when a player attempts to switch their weapon. Primary usage of this hook is to prevent/allow weapon switching, not to detect weapon switching. It will not be called for Player:SetActiveWeapon.
---@param player Player
---@param oldWeapon Weapon
---@param newWeapon Weapon
---@return boolean
function class:PlayerSwitchWeapon(player,oldWeapon,newWeapon) end


---The Move hook is called for you to manipulate the player's CMoveData. This hook is called moments before GM:Move and GM:PlayerNoClip. This hook will not run when inside a vehicle. GM:VehicleMove will be called instead.
---@param player Player
---@param mv CMoveData
function class:PlayerTick(player,mv) end


---Called when a player has been hit by a trace and damaged (such as from a bullet). Returning true overrides the damage handling and prevents GM:ScalePlayerDamage from being called.
---@param ply Player
---@param dmginfo CTakeDamageInfo
---@param dir Vector
---@param trace table
---@return boolean
function class:PlayerTraceAttack(ply,dmginfo,dir,trace) end


---Called when a player unfreezes an object.
---@param ply Player
---@param ent Entity
---@param physobj PhysObj
function class:PlayerUnfrozeObject(ply,ent,physobj) end


---Triggered when the player presses use on an object. Continuously runs until USE is released but will not activate other Entities until the USE key is released; dependent on activation type of the Entity.
---@param ply Player
---@param ent Entity
---@return boolean
function class:PlayerUse(ply,ent) end


---Called when it's time to populate the context menu menu bar at the top.
---@param menubar Panel
function class:PopulateMenuBar(menubar) end


---Called right after the map has cleaned up (usually because game. CleanUpMap was called) See also GM:PreCleanupMap.
function class:PostCleanupMap() end


---Called right after the 2D skybox has been drawn - allowing you to draw over it. This is a rendering hook which provides a 3d rendering context.
function class:PostDraw2DSkyBox() end


---Called after rendering effects. This is where halos are drawn. Called just before GM:PreDrawHUD. This is a rendering hook which provides a 2d rendering context.
function class:PostDrawEffects() end


---Called after GM:PreDrawHUD, GM:HUDPaintBackground and GM:HUDPaint but before GM:DrawOverlay. Unlike GM:HUDPaint(Background) hooks, this will still be called when the main menu is visible. And so will be GM:PreDrawHUD This is a rendering hook which provides a 2d rendering context.
function class:PostDrawHUD() end


---Called after drawing opaque entities. See also GM:PostDrawTranslucentRenderables and GM:PreDrawOpaqueRenderables. This is a rendering hook which provides a 3d rendering context.
---@param bDrawingDepth boolean
---@param bDrawingSkybox boolean
---@param isDraw3DSkybox boolean
function class:PostDrawOpaqueRenderables(bDrawingDepth,bDrawingSkybox,isDraw3DSkybox) end


---Called after the player hands are drawn.
---@param hands Entity
---@param vm Entity
---@param ply Player
---@param weapon Weapon
function class:PostDrawPlayerHands(hands,vm,ply,weapon) end


---Called after drawing the 3D skybox. This will not be called if skybox rendering was prevented via the GM:PreDrawSkyBox hook. See also GM:PostDraw2DSkyBox. This is a rendering hook which provides a 3d rendering context.
function class:PostDrawSkyBox() end


---Called after all translucent entities are drawn. See also GM:PostDrawOpaqueRenderables and GM:PreDrawTranslucentRenderables. This is a rendering hook which provides a 3d rendering context. This is still called when r_drawentities or r_drawopaquerenderables is disabled. Issue Tracker: 3295This is not called when r_drawtranslucentworld is disabled. Issue Tracker: 3296
---@param bDrawingDepth boolean
---@param bDrawingSkybox boolean
---@param isDraw3DSkybox boolean
function class:PostDrawTranslucentRenderables(bDrawingDepth,bDrawingSkybox,isDraw3DSkybox) end


---Called after view model is drawn. This is a rendering hook which provides a 3d rendering context. The 3D rendering context in this event is different from the main view. Every render operation will only be accurate with the view model entity.
---@param viewmodel Entity
---@param player Player
---@param weapon Weapon
function class:PostDrawViewModel(viewmodel,player,weapon) end


---Called every time a bullet pellet is fired from an entity. This hook is called directly from Entity:FireBullets. Due to this, you cannot call Entity:FireBullets inside this hook or an infinite loop will occur crashing the game.
---@param entity Entity
---@param data table
---@return boolean
function class:PostEntityFireBullets(entity,data) end


---Called when an entity receives a damage event, after passing damage filters, etc. Applying damage from this hook to the entity taking damage will lead to infinite loop/crash.
---@param ent Entity
---@param dmg CTakeDamageInfo
---@param took boolean
function class:PostEntityTakeDamage(ent,dmg,took) end


---Called after the gamemode has loaded.
function class:PostGamemodeLoaded() end


---Called right after GM:DoPlayerDeath, GM:PlayerDeath and GM:PlayerSilentDeath. This hook will be called for all deaths, including Player:KillSilent Player:Alive will return false in this hook.
---@param ply Player
function class:PostPlayerDeath(ply) end


---Called after a player in your PVS (Potential Visibility Set) was drawn. This is a rendering hook which provides a 3d rendering context.
---@param ply Player
---@param flags number
function class:PostPlayerDraw(ply,flags) end


---Allows you to suppress post processing effect drawing.
---@param ppeffect string
---@return boolean
function class:PostProcessPermitted(ppeffect) end


---Called after the frame has been rendered.
function class:PostRender() end


---Called after the VGUI has been drawn. This is a rendering hook which provides a 2d rendering context.
function class:PostRenderVGUI() end


---Called just after performing an undo.
---@param undo table
---@param count number
function class:PostUndo(undo,count) end


---Called right before the map cleans up (usually because game. CleanUpMap was called) See also GM:PostCleanupMap.
function class:PreCleanupMap() end


---Called just after GM:PreDrawViewModel and can technically be considered "PostDrawAllViewModels". This is a rendering hook which provides a 3d rendering context.
function class:PreDrawEffects() end


---Called before rendering the halos. This is the place to call halo. Add. This hook is actually running inside of GM:PostDrawEffects. This is a rendering hook which provides a 3d rendering context.
function class:PreDrawHalos() end


---Called just after GM:PostDrawEffects. Drawing anything in it seems to work incorrectly.
function class:PreDrawHUD() end


---Called before all opaque entities are drawn. See also GM:PreDrawTranslucentRenderables and GM:PostDrawOpaqueRenderables. This is a rendering hook which provides a 3d rendering context.
---@param isDrawingDepth boolean
---@param isDrawSkybox boolean
---@param isDraw3DSkybox boolean
---@return boolean
function class:PreDrawOpaqueRenderables(isDrawingDepth,isDrawSkybox,isDraw3DSkybox) end


---Called before the player hands are drawn.
---@param hands Entity
---@param vm Entity
---@param ply Player
---@param weapon Weapon
---@return boolean
function class:PreDrawPlayerHands(hands,vm,ply,weapon) end


---Called before the 3D sky box is drawn. This will not be called for maps with no 3D skybox, or when the 3d skybox is disabled. (r_3dsky 0) See also GM:PostDrawSkyBox This is a rendering hook which provides a 3d rendering context.
---@return boolean
function class:PreDrawSkyBox() end


---Called before all the translucent entities are drawn. See also GM:PreDrawOpaqueRenderables and GM:PostDrawTranslucentRenderables. This is a rendering hook which provides a 3d rendering context. This is still called when r_drawentities or r_drawopaquerenderables is disabled. Issue Tracker: 3295This is not called when r_drawtranslucentworld is disabled. Issue Tracker: 3296
---@param isDrawingDepth boolean
---@param isDrawSkybox boolean
---@param isDraw3DSkybox boolean
---@return boolean
function class:PreDrawTranslucentRenderables(isDrawingDepth,isDrawSkybox,isDraw3DSkybox) end


---Called before the view model has been drawn. This hook by default also calls this on weapons, so you can use WEAPON:PreDrawViewModel. You can use GM:PreDrawEffects as a "PostDrawViewModel" hook as it is called just after the view model(s) are drawn. This is a rendering hook which provides a 3d rendering context.
---@param vm Entity
---@param ply Player
---@param weapon Weapon
---@return boolean
function class:PreDrawViewModel(vm,ply,weapon) end


---Called before view models and entities with RENDERGROUP_VIEWMODEL are drawn. You can use GM:PreDrawEffects as a PostDrawViewModel hook as it is called just after the view model(s) are drawn. This is a rendering hook which provides a 3d rendering context.
function class:PreDrawViewModels() end


---Called before the gamemode is loaded.
function class:PreGamemodeLoaded() end


---Called before the player is drawn.
---@param player Player
---@param flags number
---@return boolean
function class:PrePlayerDraw(player,flags) end


---Called by scripted_ents. Register.
---@param ent table
---@param class string
---@return boolean
function class:PreRegisterSENT(ent,class) end


---Called when a Scripted Weapon (SWEP) is about to be registered, allowing addons to alter the weapon's SWEP table with custom data for later usage. Called internally from weapons. Register.
---@param swep table
---@param class string
---@return boolean
function class:PreRegisterSWEP(swep,class) end


---Called before the renderer is about to start rendering the next frame.
---@return boolean
function class:PreRender() end


---Called just before performing an undo.
---@param undo table
function class:PreUndo(undo) end


---This will prevent in_attack from sending to server when player tries to shoot from C menu.
---@return boolean
function class:PreventScreenClicks() end


---Called when a prop has been destroyed.
---@param attacker Player
---@param prop Entity
function class:PropBreak(attacker,prop) end


---Render the scene. Used by the Stereoscopy post-processing effect. Materials rendered in this hook require $ignorez parameter to draw properly.
---@param origin Vector
---@param angles Angle
---@param fov number
---@return boolean
function class:RenderScene(origin,angles,fov) end


---Used to render post processing effects. This is a rendering hook which provides a 2d rendering context.
function class:RenderScreenspaceEffects() end


---Called when the game is reloaded from a Source Engine save system ( not the Sandbox saves or dupes ). See GM:Saved for a hook that is called when such a save file is created.
function class:Restored() end


---Called when the game is saved using the Source Engine save system (not the Sandbox saves or dupes). See GM:Restored for a hook that is called when such a save file is loaded. See also the saverestore for relevant functions.
function class:Saved() end


---Called when an NPC takes damage. This hook is called only when a specific hit group of the NPC is hit. In cases where the hitgroup doesn't matter, you should use GM:EntityTakeDamage instead!
---@param npc NPC
---@param hitgroup number
---@param dmginfo CTakeDamageInfo
function class:ScaleNPCDamage(npc,hitgroup,dmginfo) end


---This hook allows you to change how much damage a player receives when one takes damage to a specific body part. This is called only for bullet damage a player receives, you should use GM:EntityTakeDamage instead if you need to detect ALL damage.
---@param ply Player
---@param hitgroup number
---@param dmginfo CTakeDamageInfo
---@return boolean
function class:ScalePlayerDamage(ply,hitgroup,dmginfo) end


---Called when player released the scoreboard button (tab by default).
function class:ScoreboardHide() end


---Called when player presses the scoreboard button (tab by default).
---@return boolean
function class:ScoreboardShow() end


---An internal function used to send a death notice event to all clients.
---@param attacker Entity
---@param inflictor Entity
---@param victim Entity
---@param flags number
function class:SendDeathNotice(attacker,inflictor,victim,flags) end


---Sets player run and sprint speeds. This is not a hook. Treat this as a utility function to set the player's speed.
---@param ply Player
---@param walkSpeed number
---@param runSpeed number
function class:SetPlayerSpeed(ply,walkSpeed,runSpeed) end


---SetupMove is called before the engine process movements. This allows us to override the players movement. See Game Movement for an explanation on the move system.
---@param ply Player
---@param mv CMoveData
---@param cmd CUserCmd
function class:SetupMove(ply,mv,cmd) end


---Allows you to add extra positions to the player's PVS (Potential Visibility Set). This is the place to call AddOriginToPVS.
---@param ply Player
---@param viewEntity Entity
function class:SetupPlayerVisibility(ply,viewEntity) end


---Allows you to use render. Fog* functions to manipulate skybox fog. This will not be called for maps with no 3D skybox, or when the 3d skybox is disabled. (r_3dsky 0)
---@param scale number
---@return boolean
function class:SetupSkyboxFog(scale) end


---Allows you to use render. Fog* functions to manipulate world fog.
---@return boolean
function class:SetupWorldFog() end


---Called to decide whether a pair of entities should collide with each other. This is only called if Entity:SetCustomCollisionCheck was used on one or both entities. Where applicable, consider using constraint. NoCollide or a logic_collision_pair entity instead - they are considerably easier to use and may be more appropriate in some situations. This hook must return the same value consistently for the same pair of entities. If an entity changed in such a way that its collision rules change, you must call Entity:CollisionRulesChanged on that entity immediately - not in this hook and not in physics callbacks. The default Entity:CollisionRulesChanged has been found to be ineffective in preventing issues in this hook, a more reliable alternative can be found in the examples below. As long as you religiously follow the rules set by the examples this hook will work reliably without breaking, even a small mistake will break physics. This hook can cause all physics to break under certain conditions. Issue Tracker: 642
---@param ent1 Entity
---@param ent2 Entity
---@return boolean
function class:ShouldCollide(ent1,ent2) end


---Called to determine if the LocalPlayer should be drawn. If you're using this hook to draw a player for a GM:CalcView hook, then you may want to consider using the drawviewer variable you can use in your CamData structure table instead. This hook has an internal cache that is reset at the start of every frame. This will prevent this hook from running in certain cases. This cache is reset in cam. Start and in a future update in render. RenderView when rendering extra views.
---@param ply Player
---@return boolean
function class:ShouldDrawLocalPlayer(ply) end


---Called when a player executes gm_showhelp console command. (Default bind is f1)
---@param ply Player
function class:ShowHelp(ply) end


---Called when a player executes gm_showspare1 console command ( Default bind is f3 ).
---@param ply Player
function class:ShowSpare1(ply) end


---Called when a player executes gm_showspare2 console command ( Default bind is f4 ).
---@param ply Player
function class:ShowSpare2(ply) end


---Called when a player executes gm_showteam console command. ( Default bind is f2 )
---@param ply Player
function class:ShowTeam(ply) end


---Called whenever the Lua environment is about to be shut down, for example on map change, or when the server is going to shut down. Player:SteamID, Player:SteamID64, and the like will return nil for the listen host here but work fine for other players.
function class:ShutDown() end


---Called when spawn icon is generated.
---@param lastmodel string
---@param imagename string
---@param modelsleft number
function class:SpawniconGenerated(lastmodel,imagename,modelsleft) end


---Called when the Spawnmenu is Created.
function class:SpawnMenuCreated() end


---Runs when the user tries to open the chat box. Returning true won't stop the chatbox from taking VGUI focus. Issue Tracker: 855
---@param isTeamChat boolean
---@return boolean
function class:StartChat(isTeamChat) end


---Allows you to change the players inputs before they are processed by the server. This function is also called for bots, making it the best solution to control them. This is basically a shared version of GM:CreateMove. This hook is predicted, but not by usual means, it is called when a CUserCmd is generated on the client, and on the server when it is received, so it is necessary for this hook to be called clientside even on singleplayer
---@param ply Player
---@param ucmd CUserCmd
function class:StartCommand(ply,ucmd) end


---Called right before an entity starts driving. Overriding this hook will cause it to not call drive. Start and the player will not begin driving the entity.
---@param ent Entity
---@param ply Player
function class:StartEntityDriving(ent,ply) end


---Called when you start a new game via the menu.
function class:StartGame() end


---Called every frame. This will be the same as GM:Tick on the server when there is no lag, but will only be called once every processed server frame during lag. See GM:Tick for a hook that runs every tick on both the client and server. On server, this hook WILL NOT run if the server is empty, unless you set the ConVar sv_hibernate_think to 1.
function class:Think() end


---Called every server tick. Serverside, this is similar to GM:Think. This hook WILL NOT run if the server is empty, unless you set the ConVar sv_hibernate_think to 1
function class:Tick() end


---Isn't call when CalcMainActivity return a valid override sequence id Allows you to translate player activities.
---@param ply Player
---@param act number
---@return number
function class:TranslateActivity(ply,act) end


---Animation updates (pose params etc) should be done here.
---@param ply Player
---@param velocity Vector
---@param maxSeqGroundSpeed number
function class:UpdateAnimation(ply,velocity,maxSeqGroundSpeed) end


---Called when a variable is edited on an Entity (called by Edit Properties. . . menu). See Editable Entities for more information.
---@param ent Entity
---@param ply Player
---@param key string
---@param val string
---@param editor table
function class:VariableEdited(ent,ply,key,val,editor) end


---Called when you are driving a vehicle. This hook works just like GM:Move. This hook is called before GM:Move and will be called when GM:PlayerTick is not.
---@param ply Player
---@param veh Vehicle
---@param mv CMoveData
function class:VehicleMove(ply,veh,mv) end


---Called when user clicks on a VGUI panel.
---@param button number
---@return boolean
function class:VGUIMousePressAllowed(button) end


---Called when a mouse button is pressed on a VGUI element or menu.
---@param pnl Panel
---@param mouseCode number
function class:VGUIMousePressed(pnl,mouseCode) end


---Called as a weapon entity is picked up by a player. See also GM:PlayerDroppedWeapon. At the time when this hook is called Entity:GetOwner will return NULL. The owner is set on the next frame. This will not be called when picking up a weapon you already have as the weapon will be removed and WEAPON:EquipAmmo will be called instead.
---@param weapon Weapon
---@param owner Player
function class:WeaponEquip(weapon,owner) end


---Called when an addon from the Steam workshop finishes downloading. Used by default to update details on the workshop downloading panel.
---@param id number
---@param title string
function class:WorkshopDownloadedFile(id,title) end


---Called when an addon from the Steam workshop begins downloading. Used by default to place details on the workshop downloading panel.
---@param id number
---@param imageID number
---@param title string
---@param size number
function class:WorkshopDownloadFile(id,imageID,title,size) end


---Called while an addon from the Steam workshop is downloading. Used by default to update details on the fancy workshop download panel.
---@param id number
---@param imageID number
---@param title string
---@param downloaded number
---@param expected number
function class:WorkshopDownloadProgress(id,imageID,title,downloaded,expected) end


---Called after GM:WorkshopStart.
---@param remain number
---@param total number
function class:WorkshopDownloadTotals(remain,total) end


---Called when downloading content from Steam workshop ends. Used by default to hide fancy workshop downloading panel.
function class:WorkshopEnd() end


---Called while an addon from the Steam workshop is extracting. Used by default to update details on the fancy workshop download panel.
---@param id number
---@param ImageID number
---@param title string
---@param percent number
function class:WorkshopExtractProgress(id,ImageID,title,percent) end


---Called when downloading content from Steam workshop begins. Used by default to show fancy workshop downloading panel. The order of Workshop hooks is this: WorkshopStart WorkshopDownloadTotals These are called for each new item: WorkshopDownloadFile WorkshopDownloadProgress - This is called until the file is finished WorkshopDownloadedFile WorkshopEnd (this ones called once)
function class:WorkshopStart() end


---Called when UGC subscription status changes.
function class:WorkshopSubscriptionsChanged() end


---Called when a Workshop Message is received?. Currently, it seems like the message will be #ugc. mounting every time. When does this exactly get called?. If an addon is subscribed, unsubscribed, error occurs or on any event?
---@param message string
function class:WorkshopSubscriptionsMessage(message) end


---This is used internally - although you're able to use it you probably shouldn't. Called by the engine when the game initially fetches subscriptions to be displayed on the bottom of the main menu screen.---@param num number
---@param max number
function class:WorkshopSubscriptionsProgress(num,max) end
