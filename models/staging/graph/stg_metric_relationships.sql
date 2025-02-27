with relationships as (

    {{
        dbt_project_evaluator.get_relationships("metrics")
    }}

),


final as (
    select 
        {{ dbt_utils.generate_surrogate_key(['resource_id', 'direct_parent_id']) }} as unique_id, 
        *
    from relationships
)

select distinct * from final