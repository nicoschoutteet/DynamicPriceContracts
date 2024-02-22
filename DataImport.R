library(tidyverse)

# # price data Belgium 2023 -------------------------------------------------
# df_prices <- read_csv("data/20150101-20231231_Belgium day-ahead prices.csv") %>% 
#   mutate(DateTime = with_tz(DateTime, "Europe/Brussels")) %>% 
#   filter(year(DateTime) == 2023)
# 
# 
# # RLP data Belgium 2023 ---------------------------------------------------
# df_RLP <- read_csv("data/rlp0n2023-electricity-all-dsos.csv") %>% 
#   mutate(DateTime = parse_date_time(CET, "%d/%m/%Y %H:%M")) %>% 
#   rowwise() %>% 
#   mutate(SLP_FL = mean(`Fluvius Antwerpen`, `Fluvius Limburg`, `Fluvius West`, `GASELWEST`,
#                        `IMEWO`, `INTERGEM`, `Iveka`, `IVERLEK 1`, `IVERLEK 2`, `PBE Vlaanderen`)) %>% 
#   select(DateTime, SLP_FL) %>% 
#   group_by(DateTime = floor_date(DateTime, "hour")) %>% 
#   summarize(Profile = sum(SLP_FL, na.rm = TRUE)) %>% 
#   ungroup() %>% 
#   mutate(DateTime = seq.POSIXt(as.POSIXct("2023-01-01 00:00", "Europe/Brussels"),
#                                as.POSIXct("2023-12-31 23:45", "Europe/Brussels"), 
#                                by = "1 hour"))
# 
# df <- left_join(df_prices, df_RLP) %>% 
#   write_csv("data/20230101-20231231_prices_RLP_data.csv")

df_rd <- read_csv("data/20230101-20231231_prices_RLP_data.csv") %>% 
  mutate(DateTime = with_tz(DateTime, "Europe/Brussels"))
  