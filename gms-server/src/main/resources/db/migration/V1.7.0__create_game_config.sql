drop table if exists game_config;
create table if not exists game_config
(
    id              bigint auto_increment primary key comment '自增id',
    config_type     varchar(32) not null comment '参数类型',
    config_sub_type varchar(32) comment '参数子类型',
    config_clazz    varchar(256) comment '参数值java类型',
    config_code     varchar(64) not null comment '参数名',
    config_value    varchar(256) not null comment '参数值',
    config_desc     varchar(512) comment '参数描述，中英文，关联i18n表lang_resources',
    update_time     timestamp comment '最后更新时间'
    ) comment '游戏参数表';

insert into game_config (config_type, config_sub_type, config_clazz, config_code, config_value, config_desc)
values ('world', '0', 'java.lang.Integer', 'flag', '0', '0=普通大区，1=活动大区，2=新区，3=热门大区(0=nothing,1=event,2=new,3=hot)'),
       ('world', '0', 'java.lang.String', 'server_message', 'Welcome to Scania!', '顶部滚动信息(top scrolling information)'),
       ('world', '0', 'java.lang.String', 'event_message', 'Scania', '大区描述(world description)'),
       ('world', '0', 'java.lang.String', 'recommend_message', 'Welcome to Scania!', '大区推荐信息(world recommend information)'),
       ('world', '0', 'java.lang.Integer', 'channel_size', '3', '启动频道数(default channel size)'),
       ('world', '0', 'java.lang.Float', 'exp_rate', '1.0', '经验倍率(exp rate)'),
       ('world', '0', 'java.lang.Float', 'meso_rate', '1.0', '金币倍率(meso rate)'),
       ('world', '0', 'java.lang.Float', 'drop_rate', '1.0', '掉落倍率(drop rate)'),
       ('world', '0', 'java.lang.Float', 'boss_drop_rate', '1.0', 'BOSS掉落倍率(boss drop rate)'),
       ('world', '0', 'java.lang.Float', 'quest_rate', '1.0', '任务倍率(quest rate)'),
       ('world', '0', 'java.lang.Float', 'fishing_rate', '1.0', '钓鱼倍率(fishing rate)'),
       ('world', '0', 'java.lang.Float', 'travel_rate', '1.0', '旅行倍率(travel rate)'),
       ('world', '0', 'java.lang.Float', 'level_exp_rate', '0', '等级经验倍率，0为不启用(extra level exp rate, 0 is disabled)'),
       ('world', '0', 'java.lang.Integer', 'quick_level', '0', '冲刺等级，0为不启用(Gain bonus experience for levels below the target, and receive reduced experience for levels at or above the target.)'),
       ('world', '0', 'java.lang.Float', 'quick_level_rate', '0', '冲刺等级倍率(Gain bonus experience for levels below the target, and receive reduced experience for levels at or above the target.)'),

       ('server', 'Core', 'java.lang.Integer', 'max_world_size', '21', '最多大区数(max world size)'),
       ('server', 'Core', 'java.lang.Integer', 'channel_locks', '20', '每个频道锁数量(Total number of structure management locks each channel has.)'),
       ('server', 'Core', 'java.lang.Long', 'update_interval', '777', '服务中需要状态更新的任务时间间隔，毫秒(The time interval for tasks that require status updates in the service, millisecond)'),
       ('server', 'Core', 'java.lang.Boolean', 'use_max_range', 'true', '针对地图上的所有事件发送和接收数据包，而不仅仅是视图范围内的那些(Will send and receive packets from all events on a map, rather than those of only view range.)'),
       ('server', 'Core', 'java.lang.Boolean', 'use_max_range_echo_of_hero', 'true', '英雄的回声技能范围是否最大(Skill echo_of_hero max range.)'),
       ('server', 'Core', 'java.lang.Boolean', 'use_autosave', 'true', '开启自动存档，1小时保存一次(Save characters to DB each 1 hour.)'),
       ('server', 'Core', 'java.lang.Integer', 'max_channel_size', '20', '最多频道数(max channel size)'),
       ('server', 'Core', 'java.lang.Integer', 'channel_capacity', '100', '频道最多容纳人数(maximum capacity of the channel)'),
       ('server', 'Core', 'java.lang.String', 'timezone', 'GMT+8', '游戏时区(server timezone)'),
       ('server', 'Core', 'java.lang.Boolean', 'use_unit_price_with_comma', 'true', '解析wz时支持用逗号加点分隔的数字，如12,345.67能解析成12345.67(Set this accordingly with the layout of the unitPrices on Item.wz XML''s, whether it''s using commas or dots to represent fractions.)'),
       ('server', 'Core', 'java.lang.Long', 'item_monitor_time', '300000', '地图物品监控任务执行时间间隔，毫秒(Interval between item monitoring tasks on maps.)'),
       ('server', 'Core', 'java.lang.Long', 'item_expire_check', '10000', '执行地图物品消失任务时间间隔，毫秒(Interval between item expiring tasks on maps, which checks and makes disappear expired items.)'),
       ('server', 'Core', 'java.lang.Integer', 'item_limit_on_map', '200', '地图上允许的最大物品数量(Max number of items allowed on a map.)'),
       ('server', 'Core', 'java.lang.Integer', 'map_visited_size', '5', '最多保留玩家访问过的地图记录(Max length for last mapIds visited by a player. This is used to recover and update drops on these maps accordingly with player actions.)'),
       ('server', 'Core', 'java.lang.Long', 'mob_status_monitor_proc', '200', '怪物buff和debuff变换监控任务执行间隔，毫秒(Frequency in milliseconds between each proc on the mob disease monitor schedule.)'),
       ('server', 'Core', 'java.lang.Integer', 'mob_status_monitor_idle', '84', '监控任务空闲多少次后销毁(Idle proc count the mob disease monitor is allowed to be there before closing it due to inactivity.)'),

       ('server', 'Game Mechanics', 'java.lang.Boolean', 'collective_chr_slot', 'false', '可用角色槽位在所有大区生效，而不是单个大区(Available character slots are counted globally rather than per world server.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_custom_keyset', 'false', '在创建角色时启用HeavenMS的自定义键绑定自动设置(Enables auto-setup of the HeavenMS''s custom keybindings when creating characters.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_supply_rate_coupons', 'true', '商城是否允许出售多倍卡(Allows rate coupons to be sold through the Cash Shop.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_mts', 'false', '是否开启拍卖行(enable mts)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_cpq', 'true', '是否开启怪物嘉年华(enable cpq)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_fixed_ratio_hpmp_update', 'false', '启用HeavenMS的血蓝更新机制，升级、分配属性、转职等按照比例更新血量和蓝量(Enables the HeavenMS-builtin HPMP update based on the current pool to max pool ratio.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_duey', 'true', '启用快递系统(use duey)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_randomize_hpmp_gain', 'true', '获取血量和蓝量是否随机化，洗血会用到(Enables randomizing on MaxHP/MaxMP gains and INT accounting for the MaxMP gain on level up.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_hpmp_swap', 'false', '强制洗血蓝的点数只能加到血蓝，不能分配到其他属性(Forces players to reuse stats located on HP/MP pool only inside the HP/MP stats.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_storage_item_sort', 'true', '启用仓库整理物品功能(Enables storage "Arrange Items" feature.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_item_sort', 'true', '启用仓库排序/合并物品功能(Enables inventory "Item Sort/Merge" feature.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_item_sort_by_name', 'false', '基于名称而不是ID进行物品排序(Item sorting based on name rather than id.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_party_for_starters', 'false', '10级以下的玩家可以进行组队邀请(Players level 10 or below can create/invite other players on the given level range.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_auto_assign_starters_ap', 'true', '10级以下的玩家不能自动分配属性点(Beginners level 10 or below have their AP auto assigned, they can''t choose to level up a stat.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_auto_assign_secondary_cap', 'true', '自动分配属性点到主属性，除非主属性已经达到职业设定最大，才会分配到次属性(Prevents AP auto assign from spending on secondary stats after the player class'' cap has been reached.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_server_auto_assigner', 'false', '使用HeavenMS的属性点自动分配器(HeavenMS-builtin auto assigner)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_starting_ap_4', 'false', '使用早期GMS 4/4/4/4起始属性。为了解决属性短缺，分别在1转和2转给4个和5个属性点(Use early-GMS 4/4/4/4 starting stats. To overcome AP shortage, this gives 4AP/5AP at 1st/2nd job advancements.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_refresh_rank_move', 'true', '采用实时排名变更还是总排名变更(Show the ranking movement based on the last refresh time or the account creation time.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_novice_exp_rate', 'true', '10级以下的新手固定1倍经验(Hard sets experience rate 1x for beginners level 10 or under.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_mob_level_range', 'true', '击杀低于N级的怪物不会获得经验(Players N levels below the killed mob will gain no experience from defeating it.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_job_level_range', 'false', '不转职不会获得经验(Caps the player level on the minimum required to advance their current jobs.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_job_sp_range', 'false', '改变职业后，根据当前职业计算是否补偿技能点(Caps the player SP level on the total obtainable by their current jobs. After changing jobs, missing SP will be retrieved.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_item_suggestion', 'false', '猫头鹰搜索器只能搜索到固定配置的几个物品，而不是玩家雇佣商店的物品(Forces the Owl of Minerva and the Cash Shop to always display the defined item array instead of those featured by the players.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_unmerchable_cash', 'true', '现金物品不能出售，丢弃消失(Forces players to not sell CASH items via merchants, drops of it disappears.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_unmerchable_pet', 'true', '宠物不能出售，丢弃消失(Forces players to not sell pets via merchants, drops of it disappears.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_merchant_save', 'true', '强制雇佣商店内每次物品移动时自动保存到数据库(Forces automatic DB save on merchant owners, at every item movement on shop.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enforce_mystic_door_position', 'false', '强制传送门在出生点附近生成(Forces mystic door to be spawned near spawn points.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_spawn_loot_on_animation', 'false', '使战利品在怪物被杀后一段时间后出现(Makes loot appear some time after the mob has been killed.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_spawn_relevant_loot', 'true', '强制只生成玩家或其任何队伍成员可收集的战利品(Forces to only spawn loots that are collectable by the player or any of their party members.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_erase_permit_on_open_shop', 'true', '开店后强制消耗掉雇佣商店卡(Forces "shop permit" item to be consumed when player deploy his/her player shop.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_erase_untradeable_drop', 'true', '不可交易物品丢弃消失(Forces flagged untradeable items to disappear when dropped.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_erase_pet_on_expiration', 'false', '宠物到期后是否从背包中移除(Forces pets to be removed from inventory when expire time comes, rather than converting it to a doll.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_buff_most_significant', 'true', '同种增益取最佳，而不是覆盖(When applying buffs, the player will stick with the highest stat boost among the listed, rather than overwriting stats.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_buff_everlasting', 'false', '永久buff(Every applied buff on players holds expiration time so high it''d be considered permanent.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_multiple_same_equip_drop', 'true', '同一装备能否掉落多份(Enables multiple drops by mobs of the same equipment.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_banishable_town_scroll', 'false', '城镇卷轴可以当做回退卷轴使用(Enables town scrolls to act as if it''s a "player banish", rendering the antibanish scroll effect available.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enable_full_respawn', 'false', '怪物按最大数量生成，不取决当前地图的玩家数(At respawn task, always respawn missing mobs when they''re available. Spawn count doesn''t depend on how many players are currently there.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enable_chat_log', 'false', '日志是否打印玩家聊天信息(Whether print player chat log.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_map_ownership_system', 'false', '是否开启玩家地图所有权(on/off map ownership system)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_fishing_system', 'false', '是否开启钓鱼系统(on/off fishing system)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_old_gms_styled_pq_npcs', 'true', '跳过组队任务介绍信息，立即开始任务(Skip info about the PQs and immediately tries to register the party in.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enable_solo_expeditions', 'false', '副本任务允许单人进入(Enables start expeditions with any number of players.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enable_daily_expeditions', 'false', '是否限制远征次数，不同远征副本会按日/周限制次数(Enables daily/weekly entry limitations in expeditions.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enable_recall_event', 'false', '玩家重连是否继续上次未完成的事件(Enables a disconnected player to reaccess the last event instance they were in before logging out.)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'respawn_interval', '10000', '怪物刷新间隔，毫秒(mob respawn interval, millisecond)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_login_notification', 'false', '是否开启登录提醒(Send a world notice while player login.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_beidou_beginner_map', 'false', '新创建的冒险家进入055版本以前的青苹果地图，需要客户端支持(Beginners will be generated in the old CMS map. Use this before the client is supported.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_announce_shop_item_sold', 'false', '当玩家商店或雇佣商店中的物品被售出时，自动向所有者发送消息(Automatic message sent to owner when an item from the Player Shop or Hired Merchant is sold.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_announce_change_job', 'false', '当职业改变时，自动向熟人发送消息(Automatic message sent to acquantainces when changing jobs.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_announce_nx_coupon_loot', 'false', '玩家获得点券时是否展示浮动文本(Enables or disables the floating text when a player loots a NX card.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_announce_global_level_up', 'false', '玩家升级时全服通知，使用命令升级或GM账户除外(Automatic message sent to global when a player level up.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_joint_cash_shop_inventory', 'false', '不同职业群拥有专属仓库，不与公共仓库共享(Different job type has independent inventory.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_maker_permissive_atk_up', 'false', '允许玩家在非武器装备上强化攻击力(Allows players to use attack-based strengthening gems on non-weapon items.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_maker_fee_heuristics', 'true', '是否根据制作装备等级和类型计算制作花费，关闭则所有制作花费相同(Apply compiled values for stimulants and reagents into the Maker fee calculations. Set false to use basic constant values instead.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enable_custom_npc_script', 'false', '是否启用自定义npc脚本(Enables usage of custom HeavenMS NPC scripts.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_starter_merge', 'false', '是否开启装备合并(Allows any players to use the Equipment Merge custom mechanic.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'block_generate_cash_item', 'false', 'item/drop指令是否允许创建现金物品(Prevents creation of cash items with the item/drop command.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_whole_server_ranking', 'false', '玩家排名按所有大区统计，非当前大区(all worlds ranking replace whole world ranking)'),
       ('server', 'Game Mechanics', 'java.lang.Float', 'equip_exp_rate', '1.0', '装备经验倍率(equip exp rate)'),
       ('server', 'Game Mechanics', 'java.lang.Float', 'pq_bonus_exp_rate', '0.5', '组队任务经验倍率(pq exp rate)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'exp_split_level_interval', '5', '组队非攻击玩家必须在怪物N级之内才能获取到怪物经验(Non-contributing players must be within N level between the mob to receive EXP.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'exp_split_leech_interval', '5', '组队非攻击玩家必须在队友N级之内才能获取到怪物经验(Non-contributing players must be within N level between any contributing party member to receive EXP.)'),
       ('server', 'Game Mechanics', 'java.lang.Float', 'exp_split_mvp_mod', '0.2', '组队队长额外倍率(extra exp multiplier for party leaders)'),
       ('server', 'Game Mechanics', 'java.lang.Float', 'exp_split_common_mod', '0.8', '组队队员经验倍率(exp multiplier for party members)'),
       ('server', 'Game Mechanics', 'java.lang.Float', 'party_bonus_exp_rate', '1.0', '组队经验倍率(party bonus exp rate)'),
       ('server', 'Game Mechanics', 'java.lang.Byte', 'max_monitored_buff_stats', '5', '相同增益的buff最多记录几个，当最强的buff消失后，记录的同增益buff会进行替代(Limits accounting for "dormant" buff effects, that should take place when stronger stat buffs expires.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'max_ap', '32767', '属性点最大值(max ap value)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'max_event_levels', '8', '活动或者副本最大难度等级，不同等级奖励不同(Event has different levels of rewarding system.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'block_npc_race_condition', '500', '与NPC对话的时间间隔，毫秒(Time the player client must wait before reopening a conversation with an NPC.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'tot_mob_quest_requirement', '0', '指定时间神殿任务要求刷怪数，0为默认取wz中设置的999(Overwrites old 999-mobs requirement for the ToT questline with new requirement value, set 0 for default.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'party_search_reentry_limit', '10', '队长在进行队员匹配搜索时，最多能够搜索几轮，超过次数后需要手动重新搜索(Max amount of times a party leader is allowed to persist on the Party Search before entry expiration, thus needing to manually restart the Party Search to be able to search for members.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'allow_cash_shop_name_change', 'true', '允许玩家在商城购买改名卡(Allows players to buy name changes in the cash shop.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'allow_cash_shop_world_transfer', 'true', '允许玩家在商城购买转区(Allows players to buy world transfers in the cash shop.)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'name_change_cooldown', '2592000000', '改名冷却时间，毫秒(name change cooldown)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'world_transfer_cooldown', '2592000000', '转区冷却时间，毫秒(world transfer cooldown)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'instant_name_change', 'false', '是否等待服务器重启以应用改名，否则在客户端重连后进行(Whether or not to wait for server restart to apply name changes. Does on reconnect otherwise.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_rebirth_system', 'false', '是否开启转生系统(on/off rebirth system)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'rebirth_npc_id', '9010021', '转生NPC(rebirth npc id)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'item_expire_time', '180000', '物品预计消失时间，毫秒(Time before items start disappearing.)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'kite_expire_time', '3600000', '风筝横幅预计消失时间，毫秒(Time before kite start disappearing.)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'map_damage_overtime_interval', '2500', '地图反应堆伤害间隔，毫秒(Interval in milliseconds between map environment damage.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'map_damage_overtime_count', '2', '地图反应堆伤害次数(Map environment damage count.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'mob_status_aggro_persistence', '2', '怪物的仇恨吸引在不受新仇恨吸引多少次后消失(Idle proc count on aggro update for a mob to keep following the current controller, given him/her is the leading damage dealer.)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'mob_status_aggro_interval', '5000', '仇恨吸引刷新间隔，毫秒(Interval in milliseconds between aggro logistics update.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_auto_aggro_nearby', 'false', '怪物在玩家接近时自动仇恨吸引(Mobs start following the player when approached.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_perfect_scrolling', 'false', '砸卷失败不消耗次数(Scrolls doesn''t use slots upon failure.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enhanced_chaos_scroll', 'false', '混沌卷轴不会使装备属性变差(Equips even more powerful with chaos upgrade.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_enhanced_crafting', 'false', '制作的装备是否进行属性混沌(Apply chaos scroll on every equip crafted.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'scroll_chance_rolls', '1', '对失败概率取幂，如60%成功的卷轴，失败概率0.4，如果这里设置成2，失败概率则为0.4的平方(Number of rolls for success on a scroll, set 1 for default.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'chaos_scroll_stat_rate', '1', '混沌的属性倍率(Number of rolls of stat upgrade on a successfully applied chaos scroll, set 1 for default.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'chaos_scroll_stat_range', '5', '混沌的属性范围，-N到N之间(Stat upgrade range on chaos scrolls between -N and N.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_spikes_avoid_banish', 'false', '防滑的鞋子是否能够防止回退(Shoes equipped with spikes prevents mobs from banishing wearer.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_ultra_nimble_feet', 'false', '大大提升疾风步的跳跃力和移速(Massive speed & jump upgrade.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_ultra_recovery', 'false', '大大提升团队治疗的恢复量(Massive recovery amounts overtime.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_ultra_three_snails', 'false', '大大提升蜗牛投掷术的伤害(Massive damage on shell toss.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_full_aran_skill_set', 'false', '战神技能全满(Enables starter availability to all Aran job skills.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_fast_reuse_hero_will', 'false', '大大减少勇士的意志的冷却(Greatly reduce cooldown on Hero''s Will.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_anti_immunity_crash', 'false', '防御崩坏能够移除怪物的物理免疫和魔法免疫buff(Crash skills additionally removes the mob''s invincibility buffs.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_undispel_holy_shield', 'false', '圣灵之盾能够防止怪物驱散技能(Holy shield buff also prevents players from suffering dispel from mobs.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_full_holy_symbol', 'false', '神圣祈祷不需要队友也能获取经验加成(Holy symbol doesn''t require EXP sharers to work in full.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_add_slots_by_level', 'false', '每20级增加背包栏位(Slots are added each 20 levels.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_add_rates_by_level', 'false', '每20级增加倍率(Rates are added each 20 levels.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_stack_coupon_rates', 'false', '倍率卡允许叠加(Multiple coupons effects builds up together.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_perfect_pitch', 'false', '30级以上的玩家，每次升级获得一个音符(For level 30 or above, each level up grants player 1 perfect pitch.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_level_up_protect', 'true', '升级保护，避免连续升级(Upgrade protection to avoid continuous upgrades.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_quest_rate', 'false', '是否开启任务倍率(on/off quest rate)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'quest_point_repeatable_interval', '25', '可重复完成的任务接受时间间隔，小时(Minimum interval between repeatable quest completions for quest points to be awarded.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'quest_point_requirement', '0', '多少任务点兑换一人气点，0为不启用(Exchange factor between N quest points to +1 fame, set 0 to disable the entire quest point mechanism.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'quest_point_per_quest_complete', '0', '完成任务获取多少任务点，0为不启用(Each completed quest awards N quest points, set 0 to disable.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'quest_point_per_event_clear', '0', '完成活动和副本获取多少任务点，0为不启用(Each completed event instance awards N quest points, set 0 to disable.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'create_guild_min_partners', '6', '创建家族最少要多少人(Minimum number of members on Guild Headquarters to establish a new guild.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'create_guild_cost', '1500000', '创建家族花费多少金币(Meso spent on establishing a new guild.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'change_emblem_cost', '5000000', '改变家族徽章花费多少金币(Meso spent on changing a guild''s emblem.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'expand_guild_base_cost', '500000', '扩容家族花费多少金币(Meso spent on expanding a guild.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'expand_guild_tier_cost', '1000000', '扩容家族每等级额外花费多少金币(Meso added on expanding a guild per level.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'expand_guild_max_cost', '5000000', '扩容家族额外花费最大多少金币(Maximum of meso added while expanding a guild.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'event_max_guild_queue', '10', '家族副本频道最大家族队列数(Max number of guilds in queue for GPQ.)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'event_lobby_delay', '10', '副本大厅开放冷却时间，秒(Cooldown duration in seconds before reopening an event lobby.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_family_system', 'true', '启用学院系统(use family system)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'family_rep_per_kill', '4', '击杀每个怪物获得学院名声(Amount of rep gained per monster kill.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'family_rep_per_boss_kill', '20', '击杀每个BOSS获得学院名声(Amount of rep gained per boss kill.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'family_rep_per_level_up', '200', '升级获得学院名声(Amount of rep gained upon leveling up.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'family_max_generations', '1000', '学院树最大深度，多少代人(Maximum depth of family tree.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'use_equipment_level_up', '1', '装备最大等级，超过1开启装备升级系统(All equips lvlup at max level of N, set 1 to disable.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_equipment_level_up_slots', 'false', '装备升级是否增加可砸卷次数(Equips can upgrade slots at level up.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_equipment_level_up_power', 'false', '装备升级是否增加增加更多属性(Enable more powerful stat upgrades at equip level up.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_equipment_level_up_cash', 'false', '现金装备是否允许升级(Enable equip leveling up on cash equipments as well.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'max_equipment_level_up_stat_up', '10000', '装备升一级时能获取的最大属性(Max stat upgrade an equipment can have on a level up.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'max_equipment_stat', '32767', '装备升级的最大属性(Max stat on an equipment by leveling up.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_chair_extra_heal', 'false', '椅子大师技能坐在地图椅子上是否额外恢复(Enable map chairs to further recover player''s HP and MP.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'playernpc_initial_x', '262', '放置玩家npc的地图框架宽度(Map frame width for putting PlayerNPCs.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'playernpc_initial_y', '262', '放置玩家npc的地图框架高度(Map frame height for putting PlayerNPCs.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'playernpc_area_x', '320', '玩家npc之间的宽度间隔(Initial width gap between PlayerNPCs.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'playernpc_area_y', '160', '玩家npc之间的高度间隔(Initial height gap between PlayerNPCs.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'playernpc_area_steps', '4', '为适应玩家npc，最大缩短几次玩家npc之间的间隔(Max number of times gap is shortened to comport PlayerNPCs.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'playernpc_organize_area', 'true', '当地图上没有空间放置新的NPC时，会自动重新排列玩家NPC(Automatically rearranges PlayerNPCs on the map if there is no space set the new NPC.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'playernpc_auto_deploy', 'false', '玩家满级后是否自动部署名人堂，否则需要找到转职教官来部署(Makes PlayerNPC automatically deployed on the Hall of Fame at the instant one reaches max level. If false, eligible players must talk to 1st job instructor to deploy a NPC.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_server_auto_pot', 'false', '是否开启服务端同步客户端的警戒线实现宠物精确吃药，需要客户端支持(Upload hpmp alert to server, and auto pot by server. Use this before the client is supported.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_compulsory_auto_pot', 'false', '宠物会尽可能的吃更多的药水达到阈值(Pets will consume as many potions as needed to fulfill the auto HP/MP ratio threshold.)'),
       ('server', 'Game Mechanics', 'java.lang.Float', 'pet_auto_hp_ratio', '0.99', '自动吃药血量阈值(Will automatically consume potions until given ratio of the MaxHP is reached.)'),
       ('server', 'Game Mechanics', 'java.lang.Float', 'pet_auto_mp_ratio', '0.99', '自动吃药蓝量阈值(Will automatically consume potions until given ratio of the MaxMP is reached.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'pet_exhaust_count', '3', '宠物每几分钟饥饿一次(Number of proc counts on the exhaust schedule for fullness.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'mount_exhaust_count', '1', '坐骑几分钟疲劳一次(Number of proc counts on the exhaust schedule for tiredness.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'pets_never_hungry', 'false', '宠物和坐骑不会饥饿和疲劳(Pets and mounts will never grow hungry.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_fast_dojo_upgrade', 'false', '减少道场腰带升级需要的点数(Reduced Dojo training points amount required for a belt upgrade.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_deadly_dojo', 'true', '道场boss是否能使用致命攻击技能，玩家只剩1血1蓝(Should bosses really use 1HP,1MP attacks in dojo.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'dojo_energy_atk', '100', '每次攻击获得多少道场能量(Dojo energy gain when deal attack.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'dojo_energy_dmg', '20', '每次受到攻击获得多少道场能量(Dojo energy gain when recv attack.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'wedding_reservation_delay', '3', '处理婚礼预定前至少需要等待几轮，意味着即便你是第一个预定，也要空等几轮(Minimum idle slots before processing a wedding reservation.)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'wedding_reservation_timeout', '10', '婚礼进行前多少分钟内，情侣必须抵达现场(Limit time in minutes for the couple to show up before cancelling the wedding reservation.)'),
       ('server', 'Game Mechanics', 'java.lang.Long', 'wedding_reservation_interval', '60', '每场婚礼间隔时间，分钟(Time between wedding starts in minutes.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'wedding_bless_exp', '30000', '婚礼祝福获得多少经验(wedding bless exp)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'wedding_gift_limit', '1', '婚礼每人能送多少礼物(wedding gift limit)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'wedding_blesser_showfx', 'true', '在祝福者上显示祝福效果，而不是在被祝福的婚礼情侣上(Pops bubble sprite effect on players blessing the couple. Setting this false shows the blessing effect on the couple instead.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'enable_adventurers', 'true', '允许创建冒险家(Enable create Adventurer)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'enable_knights_of_cygnus', 'false', '允许创建骑士团(Enable create Knights of Cygnus)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'enable_the_lord_of_war', 'false', '允许创建战神(Enable create Aran)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_npcs_scriptable', 'true', '启用服务端预设脚本，否则取客户端本地展示(on/off serverside predefined script NPCs)'),
       ('server', 'Game Mechanics', 'java.util.Map', 'npcs_scriptable', '{9001105:"Rescue Gaga!"}', '哪些脚本取服务端预设(Any NPC ids that should search for a js override script.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'change_channel_force_return', 'false', '切换频道是否回到强制返回地图(Change channel will return the force_return_map, just like login again.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'mob_respawn_rate', '1', '怪物生成倍率(mob respawn rate)'),
       ('server', 'Game Mechanics', 'java.lang.Float', 'boss_respawn_mob_time_rate', '1.0', 'BOSS刷新时间速率(boss respawn time rate)'),
       ('server', 'Game Mechanics', 'java.lang.Short', 'item_slot_max', '0', '消耗栏和其他栏的物品最大堆叠，0为默认取wz定义的堆叠数量(Max item slots in Consume and Etc)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'level_up_ap_gain', '5', '升级获得的属性点，如果开启新手不允许分配属性点，则新手不受此影响(gain ap per level)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'level_up_sp_gain', '3', '升级获得的技能点，新手不受此影响(gain sp per level)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'trade_limit_meso_under_level', '15', '小于等于该等级的角色每天允许交易的金币将有金额限制，值为-1时则不限制等级(Characters below or equal to this level will have a limit on the amount of coins they can trade per day, while a value of -1 will not limit their level)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'trade_limit_meso_max', '1000000', '限制特定等级以下的角色每天允许交易的金币额度。值为-1时则不限制金额。(Limit the amount of gold coins allowed for daily transactions for characters below a specific level. When the value is -1, there is no limit on the amount.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'trade_limit_item_cash', 'false', '是否允许现金道具进行交易，需要客户端支持(Is it allowed to trade cash items? Client support is required)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'trade_limit_item_nodrop', 'false', '是否允许不可丢弃道具进行交易，需要客户端支持(Whether to allow non disposable items for trading requires client support)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'show_coupon_buff', 'true', '原版游戏不展示双倍卡buff，HeavenMS支持了展示双倍卡的buff，但是会占用怪物卡buff，导致怪物卡buff和双倍卡buff同时展示会有挤兑问题。如果你在意该问题，可以关闭此参数不让双倍卡buff展示(The old gms does not display coupon buff, and HeavenMS supported it. But it will occupy mob card buff. If you want, you can turn off this config to make mob card buff display perfectly.)'),
       ('server', 'Game Mechanics', 'java.lang.Boolean', 'use_equipment_gender_limit', 'false', '是否使用装备时进行性别校验，需要客户端支持混用。(Whether to perform gender verification when using equipment requires client support for mixed use.)'),
       ('server', 'Game Mechanics', 'java.lang.Integer', 'system_rescue_maperror_changeid', '910000000', '卡地图救援系统，输入解救到指定地图ID[需要>0]，如果地图ID不存在则随机解救到[射手村，魔法密林，勇士部落，废弃都市，明珠港](Map exception error rescue system, input rescue to specified map ID[Need>0], if map ID does not exist, randomly rescue to [Henesys, Ellinia, Perion, Kerning City, Lith Harbor])'),

       ('server', 'Safe', 'java.lang.Boolean', 'enable_pic', 'false', '是否开启pic(on/off pic)'),
       ('server', 'Safe', 'java.lang.Boolean', 'enable_pin', 'false', '是否开启pin(on/off pin)'),
       ('server', 'Safe', 'java.lang.Integer', 'bypass_pic_expiration', '20', '开启pic后，客户端超过多少分钟不活跃被认为失效，0为不启用(After enabling PIC, how many minutes of inactivity on the client are considered invalid. 0 is disabled.)'),
       ('server', 'Safe', 'java.lang.Integer', 'bypass_pin_expiration', '15', '开启pin后，客户端超过多少分钟不活跃被认为失效，0为不启用(After enabling PIN, how many minutes of inactivity on the client are considered invalid. 0 is disabled.)'),
       ('server', 'Safe', 'java.lang.Boolean', 'automatic_register', 'true', '是否开启自动注册(Automatically register players when they login with a nonexistent username.)'),
       ('server', 'Safe', 'java.lang.Boolean', 'bcrypt_migration', 'true', '是否启用新版密码加密机制(enable new password encryption)'),
       ('server', 'Safe', 'java.lang.Boolean', 'deterred_multi_client', 'false', '是否校验多开(Enables detection of multi-client and suspicious remote IP on the login system.)'),
       ('server', 'Safe', 'java.lang.Integer', 'max_allowed_account_hwid', '10', '一个账号最多允许存在多少台机器上登录，机器一段时间不登录就会失效，不会占用次数(Allows up to N concurrent HWID for an account. HWID remains linked to an account longer the more times it is used to login.)'),
       ('server', 'Safe', 'java.lang.Integer', 'max_account_login_attempt', '15', '一定时间间隔内允许同一账号登录的最大次数(After N tries on an account, login on that account gets disabled for a short period.)'),
       ('server', 'Safe', 'java.lang.Long', 'login_attempt_duration', '120000', '允许同一账号重复登录的时间间隔，毫秒(Period in milliseconds the login attempt remains registered on the system.)'),
       ('server', 'Safe', 'java.lang.Boolean', 'use_ip_validation', 'false', '在登录时启用IP检查(Enables IP checking when logging in.)'),
       ('server', 'Safe', 'java.lang.Boolean', 'use_character_account_check', 'false', '在登录时启用账号角色检查，可能影响性能(Enables one-character-per-account check when logging in. This might be resource intensive.)'),
       ('server', 'Safe', 'java.lang.Boolean', 'use_auto_ban', 'false', '开启自动封禁(on/off auto ban)'),
       ('server', 'Safe', 'java.lang.Boolean', 'use_auto_ban_log', 'false', '开启自动封禁日志(on/off auto ban warning log)'),
       ('server', 'Safe', 'java.lang.Boolean', 'use_exp_gain_log', 'false', '开启经验获取日志(on/off exp gain log)'),

       ('server', 'Net', 'java.lang.Long', 'timeout_duration', '3600000', '客户端多久没有发包后，会被服务端断开连接，毫秒(Kicks clients who don''t send any packet to the game server in due time, millisecond.)'),

       ('server', 'Debug', 'java.lang.Boolean', 'use_debug', 'false', '将在客户端上启用一些面向调试的文本打印(Will enable some text prints on the client, oriented for debugging purposes.)'),
       ('server', 'Debug', 'java.lang.Boolean', 'use_debug_show_eqp_exp', 'false', '打印所有装备经验获取信息(Prints on the cmd all equip exp gain info.)'),
       ('server', 'Debug', 'java.lang.Boolean', 'use_debug_show_rcvd_packet', 'false', '打印所有接收到的数据包ID(Prints on the cmd all received packet ids.)'),
       ('server', 'Debug', 'java.lang.Boolean', 'use_debug_show_life_move', 'false', '打印所有接收到的生物移动内容(Prints on the cmd all received move life content.)'),
       ('server', 'Debug', 'java.lang.Boolean', 'use_debug_show_packet', 'false', '打印所有的接收和发送数据表信息(Prints on the cmd all packet information.)'),
       ('server', 'Debug', 'java.lang.Boolean', 'no_password', 'false', '跳过密码验证凭账号直接登录，必须先开启debug模式(Login without password. It''s enabled while use_debug is true.)'),

       ('server', 'GM', 'java.lang.Integer', 'minimum_gm_level_to_trade', '4', 'gm几级以上才允许交易(minimum gm level to trade)'),
       ('server', 'GM', 'java.lang.Integer', 'minimum_gm_level_to_use_storage', '4', 'gm几级以上才允许使用仓库(minimum gm level to use storage)'),
       ('server', 'GM', 'java.lang.Integer', 'minimum_gm_level_to_use_duey', '4', 'gm几级以上才允许使用快递(minimum gm level to use duey)'),
       ('server', 'GM', 'java.lang.Integer', 'minimum_gm_level_to_drop', '4', 'gm几级以上才允许丢东西(minimum gm level to drop)'),
       ('server', 'GM', 'java.lang.Boolean', 'gm_pets_never_hungry', 'true', 'GM宠物和坐骑不会饥饿和疲劳(Pets and mounts owned by GMs will never grow hungry.)'),
       ('server', 'GM', 'java.lang.Boolean', 'use_perfect_gm_scroll', 'true', 'GM砸卷不消耗次数，必成功(Scrolls from GMs never uses up slots nor fails.)'),
       ('server', 'GM', 'java.lang.Boolean', 'use_enforce_admin_account', 'false', '开启飞行后，开启的账号非gm角色也能飞行(After enabling flight mode, the account that has enabled it can also fly, even if the character is not a GM role.)'),
       ('server', 'GM', 'java.lang.Boolean', 'use_auto_hide_gm', 'true', 'gm登录自动隐身(GMs are automatically hidden when joining)');