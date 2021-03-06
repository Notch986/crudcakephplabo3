<?php
/**
 * @var \App\View\AppView $this
 * @var \Cake\Datasource\EntityInterface $provider
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $provider->ID],
                ['confirm' => __('Are you sure you want to delete # {0}?', $provider->ID)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Providers'), ['action' => 'index']) ?></li>
    </ul>
</nav>
<div class="providers form large-9 medium-8 columns content">
    <?= $this->Form->create($provider) ?>
    <fieldset>
        <legend><?= __('Edit Provider') ?></legend>
        <?php
            echo $this->Form->control('Name');
            echo $this->Form->control('Status');
            echo $this->Form->control('Phone');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
