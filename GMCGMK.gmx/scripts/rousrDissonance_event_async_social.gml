///@function rousr_dissonance_event_async_social()
///@desc Async event function for GMLDiscord object
var _discord_event = async_load[? "discord_event"];
if (_discord_event == undefined)
  exit;
  
switch (_discord_event) {
  case "ready":
    var func = Handlers[EDiscordHandlers.Ready];
    Is_ready = true;
    script_execute(func[0], func[1]);  
  break;
  
  case "disconnected": 
  case "error":        
    var func = Handlers[EDiscordHandlers.Disconnected];
    if (_discord_event == "error") func = Handlers[EDiscordHandlers.Error];
    
    var _error_code = async_load[? "error_code"];
    var _msg = async_load[? "msg"];
    Is_ready = false;
    Last_error_code = _error_code;
    Last_error_msg  = _msg;
    script_execute(func[0], _error_code, _msg, func[1]);  
  break;
  
  case "join":         
  case "spectate":     
    var func = Handlers[EDiscordHandlers.Join];
    if (_discord_event == "spectate") func = Handlers[EDiscordHandlers.Spectate];
    var _secret = async_load[? "secret"];
    script_execute(func[0], _secret, func[1]);
  break;
  
  case "join_request":  
    var func = Handlers[EDiscordHandlers.JoinRequest];
    var _user_id   = async_load[? "user_id"];
    var _user_name = async_load[? "user_name"];
    var _avatar    = async_load[? "avatar"];
    var _av_index  = Num_avatars;
    var new_avatar = array_create(1);
    new_avatar[@ 0] = _avatar;
    Avatars[Num_avatars++] = new_avatar; // todo: load the file
    script_execute(func[0], _user_id, _user_name, _avatar, func[1]);
  break;
  
  default: exit;
}