function menu()

    local menuTest = RageUI.CreateMenu("","~p~Menu Divers")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()
         

            RageUI.ButtonWithStyle("Action joueur", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    action()
                end
            end)
            
            
            RageUI.ButtonWithStyle("Affichage",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    Affichage()
                end
            end)  

            RageUI.ButtonWithStyle("Divers",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    Information()
                end
            end)
            
        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("", true)
        end

    end

end





function action()

    local menuTest = RageUI.CreateMenu("Action","~p~Action")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()
            
            RageUI.Separator("Action du joueur")


            local ragdolling = false
            RageUI.ButtonWithStyle('Dormir / Se Reveiller', description, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
                if Selected then
                    ragdolling = not ragdolling
                    while ragdolling do
                     Wait(0)
                    local myPed = GetPlayerPed(-1)
                    SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                    ResetPedRagdollTimer(myPed)
                    AddTextEntry(GetCurrentResourceName(), ('Appuyez sur ~INPUT_JUMP~ pour vous ~b~Réveillé'))
                    DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
                    ResetPedRagdollTimer(myPed)
                    if IsControlJustPressed(0, 22) then 
                    break
                        end
                    end
                end
            end)
        

        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Affichage", true)
        end

    end

end





function Affichage()

    local menuTest = RageUI.CreateMenu("Affichage","~p~Affichage")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()
            
            RageUI.Separator("Affichage du serveur")

            RageUI.Checkbox("Afficher / Désactiver la map", nil, minimap,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    minimap = Checked
                    if Checked then
                        DisplayRadar(true)
                    else
                        DisplayRadar(false)
                    end
                end
            end)

            RageUI.ButtonWithStyle("Filtre", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    filtre()
                end
            end)
        

        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Affichage", true)
        end

    end

end

function Information()

    local menuTest = RageUI.CreateMenu("Divers","~p~Divers")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()
            
            RageUI.Separator("Information du serveur")
           
            RageUI.Separator('Votre ID : ~p~'..GetPlayerServerId(PlayerId()))
           
            RageUI.ButtonWithStyle("Discord","Voir le discord", {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    TriggerEvent('esx:showNotification','Discord.gg/hyperiaRP')
                end
            end)
            
            
            RageUI.ButtonWithStyle("Menu Touche", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if Selected then    
                    keys()
                end
            end) 


        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Divers", true)
        end

    end

end



function keys()

    local menuTest = RageUI.CreateMenu("Touche","~p~Menu Touche")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()

            RageUI.Separator("Touche")

            RageUI.ButtonWithStyle("Menu F5", nil, {RightLabel = "~p~F5"}, true, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Boutique", nil, {RightLabel = "~p~F1"}, true, function(Hovered, Active, Selected)
            end) 

            RageUI.ButtonWithStyle("menu Divers", nil, {RightLabel = "~p~F7"}, true, function(Hovered, Active, Selected)
            end) 

            RageUI.ButtonWithStyle("Menu Admin", nil, {RightLabel = "~p~F10"}, true, function(Hovered, Active, Selected)
            end) 

        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Touche", true)
        end

    end

end

function filtre()

    local menuTest = RageUI.CreateMenu("Filtre","~p~Filtre")

    RageUI.Visible(menuTest, not RageUI.Visible(menuTest))

    while menuTest do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTest,true,true,true,function()

                RageUI.Separator("Vision")            
           
                RageUI.Checkbox("Vue & lumières améliorées", description, visual, {}, function(Hovered, Selected, Active, Checked) 
                    if Selected then 
                        visual = Checked
                        if Checked then
                            SetTimecycleModifier('tunnel')
                        else
                            SetTimecycleModifier('')
                        end
                    end 
                end)

    
                RageUI.Checkbox("Couleurs amplifiées", description, visual2, {}, function(Hovered, Selected, Active, Checked) 
                    if Selected then 
                        visual2 = Checked
                        if Checked then
                            SetTimecycleModifier('rply_saturation')
                        else
                            SetTimecycleModifier('')
                        end
                    end 
                end)
    
                RageUI.Checkbox("Noir & blancs", description, visual3, {}, function(Hovered, Selected, Active, Checked) 
                    if Selected then 
                        visual3 = Checked
                        if Checked then
                            SetTimecycleModifier('rply_saturation_neg')
                        else
                            SetTimecycleModifier('')
                        end
                    end 
                end)

                RageUI.Checkbox("Visual 1", description, visual5, {}, function(Hovered, Selected, Active, Checked) 
                    if Selected then 
                        visual5 = Checked
                        if Checked then
                            SetTimecycleModifier('yell_tunnel_nodirect')
                        else
                            SetTimecycleModifier('')
                        end
                    end 
                end)

                RageUI.Checkbox("Blanc", description, visual6, {}, function(Hovered, Selected, Active, Checked) 
                    if Selected then 
                        visual6 = Checked
                        if Checked then
                            SetTimecycleModifier('rply_contrast_neg')
                        else
                            SetTimecycleModifier('')
                        end
                    end 
                end)

                RageUI.Checkbox("Dégats", description, visual8, {}, function(Hovered, Selected, Active, Checked) 
                    if Selected then 
                        visual8 = Checked
                        if Checked then
                            SetTimecycleModifier('rply_vignette')
                        else
                            SetTimecycleModifier('')
                        end
                    end 
                end)


        
        end, function()
        end)

        if not RageUI.Visible(menuTest) then
            menuTest=RMenu:DeleteType("Filtre", true)
        end

    end

end


RegisterNetEvent("siwu:menudivers") 
AddEventHandler("siwu:menudivers", function()
    menu() 
end)


RegisterCommand("+openmenuDivers", function()
    menu()
end)
RegisterKeyMapping("+openmenuDivers", "Ouvrir le menu Divers", "Keyboard", "F7")




