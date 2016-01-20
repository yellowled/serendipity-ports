{assign var="orsubmit" value=$CONST.OR_SUBMIT}
<div class="postWrapper">
    <div class="post">
    {if $plugin_contactform_articleformat}
        <h1>{$plugin_contactform_name}</h1>
    {else}
        <h1>{$plugin_contactform_pagetitle}</h1>
    {/if}

        <div>{$plugin_contactform_preface}</div>

    {if $is_contactform_sent}
        <p class="serendipity_msg_notice">{$plugin_contactform_sent}</p>
    </div>

    <div class="clear"></div>
    {else}
      {if $is_contactform_error}
        <p class="serendipity_msg_important">{$plugin_contactform_error}</p>

        <!-- Needed for Captchas -->
        {foreach from=$comments_messagestack item="message"}
        <p class="serendipity_msg_important">{$message}</p>
        {/foreach}
      {/if}
    </div>

    <div class="clear"></div>

    <div id="respond">
      <div class="serendipityCommentForm">
        <a id="serendipity_CommentForm"></a>
        <form id="commentform" action="{$commentform_action}#feedback" method="post">
        <div>
    	    <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
            <input type="hidden" name="serendipity[commentform]" value="true" />
	</div>

        <div class="left-sidebar">
            <h3>{$CONST.PLUGIN_CONTACTFORM_TITLE}</h3>

            <p><input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="22" class="field" tabindex="1" />
               <label for="serendipity_commentform_name"><small>{$CONST.NAME}</small></label></p>
            <p><input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="22" class="field" tabindex="2" />
               <label for="serendipity_commentform_email"><small>{$CONST.EMAIL}</small></label></p>
            <p><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="22" class="field" tabindex="3" />
               <label for="serendipity_commentform_url"><small>{$CONST.HOMEPAGE}</small></label></p>
            <p><input type="submit" name="serendipity[submit]" value="{$orsubmit}" tabindex="5" /></p>
        </div>
        <div class="form-content comment-form">
            <textarea rows="5" cols="56" id="serendipity_commentform_comment" name="serendipity[comment]" tabindex="4">{$commentform_data}</textarea>
            {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
        </div>
        </form>
      </div>
    </div>
{/if}
</div>