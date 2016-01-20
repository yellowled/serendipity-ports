<div id="formsblock" class="clearfix">
    <h3 class="hi">{if $plugin_contactform_articleformat}{$plugin_contactform_name}{else}{$plugin_contactform_pagetitle}{/if}</h3>

{if $is_contactform_error}
    <div class="serendipity_center serendipity_msg_important">{$plugin_contactform_error}</div>
  <!-- Needed for Captchas -->
  {foreach from=$comments_messagestack item="message"}
    <div class="serendipity_center serendipity_msg_important">{$message}</div>
  {/foreach}
{/if}

{if (empty($is_contactform_sent))}
    <div>{$plugin_contactform_preface}</div>
{/if}

{if $is_contactform_sent}
    <div class="serendipity_center serendipity_msg_notice">{$plugin_contactform_sent}</div>
{else}

<!-- This whole commentform style, including field names is needed -->
<!-- for Captchas. The spamblock plugin relies on the field names  -->
<!-- [name], [email], [url], [comment]!                            -->

    <div class="serendipityCommentForm">
        <a id="serendipity_CommentForm"></a>
        <form id="commentform" action="{$commentform_action}#feedback" method="post">
        <div>
            <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
            <input type="hidden" name="serendipity[commentform]" value="true" />
        </div>
        <p><input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="40" />
           <label for="serendipity_commentform_name">{$CONST.NAME}</label></p>
        <p><input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="40" />
           <label for="serendipity_commentform_email">{$CONST.EMAIL}</label></p>
        <p><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="40" />
           <label for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label></p>
        <p><textarea rows="10" cols="60" id="serendipity_commentform_comment" name="serendipity[comment]">{$commentform_data}</textarea></p>
        {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}

        <p><input class="floatl" id="submit" type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" /></p>
    </div>
{/if}
</div>