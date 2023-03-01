# Asana Scrum Dashboard
dbt project for creating a dataset for tracking Scrum sprint metrics based on Asana data as synced by Fivetran and seeds for sprint attributes (names, start/end dates) and company holidays.

*Depends on*
- [dbt_utils package](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/)
- Asana Task object as synced by [Fivetran Asana connector](https://fivetran.com/docs/applications/asana#schemainformation)

## DAG of sources, models, and exposure created by this project
![image](https://user-images.githubusercontent.com/38505252/222024419-fb1ed2eb-8834-4e95-b5f7-c99e96842a72.png)

## Screenshots of dashboard based on final model
This dashboard is shown for illustrative purposes only. It was developed separately in [Sigma](https://sigmacomputing.com) and there's no code for it in this repo.
### Burndown
![image](https://user-images.githubusercontent.com/38505252/222024833-f5214875-ebb1-4d8e-a34c-68ab5ccbe79b.png)

### Velocity and Points per Day trend
![image](https://user-images.githubusercontent.com/38505252/222024984-744611d4-f8e9-4128-a3ab-cb06cf405ba0.png)
