<div id="calendar_wrap">
<table summary="{$CONST.CALENDAR}">
    <caption> {$plugin_calendar_head.month_date|formatTime:"%B %Y":false} </caption>

    <thead>
        <tr>
{foreach from=$plugin_calendar_dow item="dow"}
           <th scope="col" abbr="{$dow.date|@formatTime:"%A":false}" title="{$dow.date|@formatTime:"%A":false}">{$dow.date|@formatTime:"%A":false|@truncate:1:'':true}</th>
{/foreach}
        </tr>
    </thead>

    <tfoot>
        <tr>
           <td id="prev" colspan="3" abbr="{$CONST.BACK}">{if $plugin_calendar_head.minScroll le $plugin_calendar_head.month_date}<a title="{$CONST.BACK}" href="{$plugin_calendar_head.uri_previous}">{/if}&laquo;{if $plugin_calendar_head.minScroll le $plugin_calendar_head.month_date}</a>{/if}</td>
           <td class="pad"></td>
           <td id="next" colspan="3" abbr="{$CONST.FORWARD}">{if $plugin_calendar_head.maxScroll ge $plugin_calendar_head.month_date}<a title="{$CONST.FORWARD}" href="{$plugin_calendar_head.uri_next}">{/if}&raquo;{if $plugin_calendar_head.maxScroll ge $plugin_calendar_head.month_date}</a>{/if}</td>
        </tr>
    </tfoot>

    <tbody>
{foreach from=$plugin_calendar_weeks item="week"}
        <tr>
        {foreach from=$week.days item="day"}
           <td>{if isset($day.properties.Active) and $day.properties.Active}<a href="{$day.properties.Link}">{/if}{$day.name|@default:"&#160;"}{if isset($day.properties.Active) and $day.properties.Active}</a>{/if}</td>
        {/foreach}
        </tr>
{/foreach}
    </tbody>
</table>
</div>
