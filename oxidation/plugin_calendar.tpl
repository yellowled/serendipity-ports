<div id="calendar_wrap">
    <table summary="{$CONST.CALENDAR}" style="width: 100%" cellspacing="0" cellpadding="0">
        <caption>{$plugin_calendar_head.month_date|formatTime:"%B '%y":false}</caption>
        <thead>
        <tr>
    {foreach from=$plugin_calendar_dow item="dow"}
           <th scope="col" abbr="{$dow.date|@formatTime:"%A":false}" title="{$dow.date|@formatTime:"%A":false}">{$dow.date|@formatTime:"%a":false}</th>
    {/foreach}
        </tr>
        </thead>
        <tfoot>
        <tr>
{if $plugin_calendar_head.minScroll le $plugin_calendar_head.month_date}
           <td colspan="3" id="prev"><a title="{$CONST.BACK}" href="{$plugin_calendar_head.uri_previous}">&laquo; {$CONST.BACK}</a></td>
{/if}
           <td class="pad">&nbsp;</td>
{if $plugin_calendar_head.maxScroll ge $plugin_calendar_head.month_date}
           <td colspan="3" id="next"><a title="{$CONST.FORWARD}" href="{$plugin_calendar_head.uri_next}">{$CONST.FORWARD} &raquo;</a></td>
{/if}
        </tr>
        </tfoot>
        <tbody>
{foreach from=$plugin_calendar_weeks item="week"}
        <tr class="serendipity_calendar">
    {foreach from=$week.days item="day"}
           <td class="serendipity_calendarDay {$day.classes}"{if isset($day.properties.Title)} title="{$day.properties.Title}"{/if}>{if isset($day.properties.Active) and $day.properties.Active}<a href="{$day.properties.Link}">{/if}{$day.name|@default:"&#160;"}{if isset($day.properties.Active) and $day.properties.Active}</a>{/if}</td>
    {/foreach}
        </tr>
{/foreach}
        </tbody>
    </table>
</div><!-- /#calendar_wrap -->
