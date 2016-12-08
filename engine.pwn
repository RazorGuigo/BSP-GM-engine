//Funções
forward	carregarmapas_comuns_load(filename[]);					carrega o mapa de tal arquivo
forward AutoRestart();											reinicia o servidor
forward ClearChatbox(playerid, lines);							limpar chat
forward mirandosniper(playerid);								o player esta mirando com uma sniper?
forward gethudplayer(playerid);									----------------------------
forward gethudveh(playerid);
forward gethudairveh(playerid);
forward gethudanim(playerid);									"retornar string de qual hud esta usando"
forward gethudscope(playerid);
forward gethudfps(playerid);									----------------------------
forward isacar(playerid);
forward isatruck(playerid);
forward isabike(playerid);				
forward Playercoordenador(playerid);							player é um coordenador?
forward bemvindo(playerid);										mensagem de bem vindo
forward SendPlayerChat(playerid, string[]);						chat do servidor
forward	kickar(i);												kickar o player
forward voltaradmin(playerid);									voltar onde estava antes de morrer, ou teleportar "/ir"
forward status_teleporte(d);									teleporte permitido?
forward enable_teleporte(status);								permitir teleporte
forward SendClientMessage_idioma(playerid, mensagem);			SendClientMessage(...)conforme o idioma do player
forward SendClientMessage_all_idioma(mensagem);					SendClientMessageToAll(...) conforme o idioma da pessoa
forward contar(texto[]);										contar até um determinado tempo, e mostrar o texto
forward SetPlayerHealthEx(plid, Float:health);					setar HP
forward ligarcarro(playerid,opcao);								"0 desliga | 1 liga | 3 desbuga/retorna se o carro esta ligado/liga se o carro for vip"
forward corrigiracentos(texto[]);								corrigir acentos de BR/EUA
forward recetvar(playerid);										recetar todos as variaveis do player
forward SetAttComerativo(playerid, mask = -1, data = -1);		setar anexos comemorativos de datas no player
forward LigarHUDVeh(playerid, hudtype=-1);						mostrar hud de veiculo "-1 escolhido pelo player | 0 esconder | 1 padrão | 2 dten"

forward SetPlayerAttachedObjectEx(playerid, index, modelid, bone, 
	Float:fsetX, Float:fsetY, Float:fsetZ, 
	Float:fRotX, Float:fRotY, Float:fRotZ,
	Float:fEscX, Float:fEscY, Float:fEscZ,
	color1 = 0, color2 = 0);									setar o att conforme a skin do jogador!


forward GetPlayerAttachedObjectEx(playerid, bone, 
	Float:fsetX, Float:fsetY, Float:fsetZ, 
	Float:fRotX, Float:fRotY, Float:fRotZ,
	Float:fEscX, Float:fEscY, Float:fEscZ,
	&Float:PX, &Float:PY, &Float:PZ, 
	&Float:AX, &Float:AY, &Float:AZ, 
	&Float:EX, &Float:EY, &Float:EZ);							Pegar a coordenada ajustada do att conforme a skin do jogador!


-----------------------------------------------------------------------------------------------------------------

Calback:


public CronServe();
{
	chamado a cada 1 segundo para atualizar relogio
}
public Arcon_servername();
{
	chamado a cada 1 segundo para trocar rcon e scon, e ainda alterar nomes e rules("ysf") do server
}                  
public OnTick();
{
	chamado a cada 100ms, para antihacks & huds
	no return
}
public OnPlayerChangeWeapon(playerid, oldweapon, newweapon)
{
	quando player troca de arma segurando na mão
	return 1; -> permanece
	return 0; -> desarma a mão
}
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	quando player troca de interior
	no return
}
public OnPlayerChangeDuck(playerid, duck)
{
	quando player levanta ou agaixa
	no return
}
public OnPlayerChangeSurf(playerid, newstate, oldstate)
{
	chamado player sobe ou desce de cima de um veiculo
	newstate & oldstate recebem o vehicleid ou INVALID_VEHICLE_ID
}
public OnPlayerShotVehicle(playerid, vehicleid, weaponid, Float:amount, bodypart)
{
	chamado quando player atira no veiculo (indenpende se tiver o cupado ou não)
	return 0; -> não causara dano
	return 1; -> dano vai ser atualizado
}
public OnPlayerDamageDone(playerid, Float:amount, issuerid, weapon, bodypart)
{
	quando o player ja recebeu o dano,
	no return
}
public OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{
	similar a "OnPlayerGiveDamage(playerid, damagedid, amount, weaponid)"
	porem você pode alterar diretamente o amout, issuerid, weapon, bodypart
	return 0; -> não causara dano
	return 1; -> dano vai ser atualizado
}
public OnPlayerEnterDynamicArea(playerid, areaid) 
{
	quando o player entra em uma area é chamado!
	no return
}
public OnPlayerEnterGangZone(playerid, zoneid)
{
	quando player entra em uma gangzone
	no return
}
public OnVehicleMod(playerid, vehicleid, componentid)
{
	quando veiculo é modificado
	return 1; -> atualiza a mod
	return 0; -> mod é negado!
}
public OnVehicleCreate(vehicleid);
{
	chamado quando um veiculo é criado
	return 0; -> veiculo é deletado
	return 1; -> veiculo continua no sv
}
public OnVehicleParamChange(vehicleid, type, newparam, oldparam)
{
	chamado quando o servidor ou player altera o parametro de um carro
	return 0; -> não altera o parametro
	return 1; -> atualiza o parametro
}
public OnVehicleFuelChange(vehicleid, newfuel, oldfuel)
{
	chamado quando o veiculo altera velocidade:
	return 0; -> não altera combustivel
	return 1; -> combustivel vai ser atualizado
}
