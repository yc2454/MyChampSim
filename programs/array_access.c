struct Node
{
    int field[10];
    struct Node* next;
};

void do_work(struct Node* node) {
    node->field[6] = node->field[5] + node->field[4];
}

void simple_chase(struct Node *node, int count){
    for (int i = 0; i < count; i++)
    {
        do_work(node);
        node = node->next;
    }
    
}