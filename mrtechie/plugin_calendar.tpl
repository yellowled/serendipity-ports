<div id="calendar_wrap">
    <table id="wp-calendar" summary="Calendar">
        <caption><a style="white-space: nowrap" href="{$plugin_calendar_head.uri_month}">{$plugin_calendar_head.month_date|formatTime:"%B '%y":false}</a></caption>
        <thead>
            <tr>
            {foreach from=$plugin_calendar_dow item="dow"}
               <th scope="col" abbr="{$dow.date|@formatTime:"%A":false}" title="{$dow.date|@formatTime:"%A":false}">{$dow.date|@formatTime:"%a":false}</th>
            {/foreach}
            </tr>
        </thead>
        <tfoot>
            <tr>
               <td colspan="3" id="prev">
               {if $plugin_calendar_head.minScroll le $plugin_calendar_head.month_date}
                   <a title="{$CONST.BACK}" href="{$plugin_calendar_head.uri_previous}">&laquo;</a>
               {/if}
               </td>
               <td class="pad">&nbsp;</td>
               <td colspan="3" id="next" class="pad">
               {if $plugin_calendar_head.maxScroll ge $plugin_calendar_head.month_date}
                   <a title="{$CONST.FORWARD}" href="{$plugin_calendar_head.uri_next}">&raquo;</a>
               {/if}
               </td>
        </tfoot>
        <tbody>
        {foreach from=$plugin_calendar_weeks item="week"}
        <tr>
           {foreach from=$week.days item="day"}
           <td class="serendipity_calendarDay {$day.classes}"{if isset($day.properties.Title)} title="{$day.properties.Title}"{/if}>{if isset($day.properties.Active) and $day.properties.Active}<a href="{$day.properties.Link}">{/if}{$day.name|@default:"&#160;"}{if isset($day.properties.Active) and $day.properties.Active}</a>{/if}</td>
           {/foreach}
        </tr>
        {/foreach}
        </tbody>
    </table>
</div>
