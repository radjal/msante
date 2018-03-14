<a class="button btn orange" id="search-btn" onclick="$('#search').slideToggle()">Filter</a>
        <a href="/admin/token" class="btn gray"><?php echo lang('token:reset') ?></a>

<div id="search" style="display: none">
    <form method="get">
        <button type="submit" name="searchBtn" class="btn blue"><?php echo lang('token:search') ?></button>
        <a href="/admin/token" class="btn gray"><?php echo lang('token:reset') ?></a>
            <br/>
            <?php echo $this->html_m->form_input('id', $this->input->get('id')) ?>
            <?php echo $this->html_m->form_input('token', $this->input->get('token')) ?>
            <?php echo $this->html_m->form_input('ip', $this->input->get('ip')) ?>
            <?php echo $this->html_m->form_input('user_agent', $this->input->get('user_agent')) ?> 
            <?php echo $this->html_m->form_input('counter', $this->input->get('counter')) ?>
            <?php echo $this->html_m->form_input('timestamp', $this->input->get('timestamp')) ?>
            <?php echo $this->html_m->form_input('alive', $this->input->get('alive')) ?>

        <button type="submit" name="searchBtn" class="btn blue"><?php echo lang('token:search') ?></button>
        <a href="/admin/token" class="btn gray"><?php echo lang('token:reset') ?></a>
    </form>
</div>
<div id="views">
</div>